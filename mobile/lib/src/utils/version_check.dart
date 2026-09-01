import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:url_launcher/url_launcher.dart';

part 'version_check.g.dart';

/// How long a completed check is trusted for.
///
/// This is an emergency brake, not an update nag: the answer changes a handful
/// of times a year. It used to be fetched from go_router's `redirect`, i.e.
/// once per screen transition, which woke the radio for a 28-byte answer all
/// day long. Now it runs at launch and, at most this often, when the app comes
/// back to the foreground.
const _checkInterval = Duration(hours: 6);

DateTime? _lastCheckedAt;
bool _isCheckVersionRunning = false;

/// Clears the launch-once/throttle state so each test starts from scratch.
@visibleForTesting
void resetVersionCheckState() {
  _isCheckVersionRunning = false;
  _lastCheckedAt = null;
}

final packageInfoProvider = Provider<Future<PackageInfo>>((ref) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
});

/// The store page for the running platform, from `--dart-define-from-file`
/// (`dart_defines/{dev,prod}.json`).
///
/// A provider rather than a bare `String.fromEnvironment`: that is const-folded
/// at compile time, so a test cannot vary it. The dialog's escape hatch depends
/// on this being empty, which is exactly the case worth testing.
final storeUrlProvider = Provider<String>((ref) {
  return Platform.isAndroid
      ? const String.fromEnvironment('androidStoreURL')
      : const String.fromEnvironment('iosStoreURL');
});

final versionCheckProvider = Provider<FutureOr Function(BuildContext?)>((ref) {
  final versionRepository = ref.watch(versionRepositoryProvider);
  final packageInfo = ref.watch(packageInfoProvider);
  final storeUrl = ref.watch(storeUrlProvider);
  return (context) =>
      _checkVersion(context, versionRepository, packageInfo, storeUrl);
});

Future<void> _checkVersion(
    BuildContext? context,
    VersionRepository versionRepository,
    Future<PackageInfo> packageInfoFuture,
    String storeUrl) async {
  if (_isCheckVersionRunning) return;

  final lastCheckedAt = _lastCheckedAt;
  if (lastCheckedAt != null &&
      DateTime.now().difference(lastCheckedAt) < _checkInterval) {
    return;
  }

  _isCheckVersionRunning = true;
  try {
    if (context == null) return;

    final String minRequired;
    try {
      minRequired = await versionRepository.fetchMinRequiredVersion();
    } catch (_) {
      // Offline, or the project is paused. Say nothing and try again next
      // time -- `_lastCheckedAt` is deliberately left alone so the retry is
      // not throttled away. A brake that engages because the network is down
      // would be far worse than one that misses a launch.
      return;
    }
    _lastCheckedAt = DateTime.now();

    final packageInfo = await packageInfoFuture;
    if (!context.mounted) return;
    if (!isUpdateRequired(
        appVersion: packageInfo.version, minRequired: minRequired)) {
      return;
    }

    final storeUri = storeUriFrom(storeUrl);
    showDialog(
      barrierDismissible: false,
      context: context, // use this context to show dialog
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(t.general.version.updateAlertTitle),
            content: Text(t.general.version.updateAlertContent(
                requiredVersion: minRequired,
                appVersion: packageInfo.version)),
            actions: <Widget>[
              if (storeUri != null)
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () => _openStore(context, storeUri),
                )
              else
                // No store to send the user to on this platform, and the
                // dialog is otherwise inescapable (barrierDismissible: false
                // + WillPopScope). Letting them out beats bricking the app --
                // set the platform's *StoreURL dart-define to get the forced
                // behaviour back.
                ElevatedButton(
                  child: Text(t.general.version.updateAlertClose),
                  onPressed: () => Navigator.of(context).pop(),
                ),
            ],
          ),
        );
      },
    );
  } finally {
    _isCheckVersionRunning = false;
  }
}

/// Whether the running build is older than the floor the project has set.
///
/// Fails open. An unparseable version on either side -- an empty column, a
/// hand-typed `v1.0.3`, a future scheme with a `-beta` suffix -- means "do not
/// block". Wrongly blocking costs the user the whole app; wrongly letting an
/// old build through costs one launch of one stale client.
@visibleForTesting
bool isUpdateRequired(
    {required String appVersion, required String minRequired}) {
  final order = compareVersions(appVersion, minRequired);
  return order != null && order < 0;
}

/// Orders two dotted numeric versions, or null if either is not one.
///
/// Compares segment by segment as integers, so `1.10.0` sorts above `1.9.0`
/// where a string comparison would get it backwards. Missing trailing segments
/// count as zero: `1.0` and `1.0.0` are equal.
@visibleForTesting
int? compareVersions(String a, String b) {
  final left = _versionSegments(a);
  final right = _versionSegments(b);
  if (left == null || right == null) return null;

  for (var i = 0; i < math.max(left.length, right.length); i++) {
    final l = i < left.length ? left[i] : 0;
    final r = i < right.length ? right[i] : 0;
    if (l != r) return l < r ? -1 : 1;
  }
  return 0;
}

List<int>? _versionSegments(String version) {
  if (version.isEmpty) return null;
  final segments = <int>[];
  for (final segment in version.split('.')) {
    final value = int.tryParse(segment);
    if (value == null || value < 0) return null;
    segments.add(value);
  }
  return segments;
}

/// The store page to open, or null when this platform has none configured.
///
/// `String.fromEnvironment` yields '' for a dart-define that was never set, and
/// `Uri.tryParse('')` happily returns an empty Uri rather than null -- so the
/// emptiness has to be checked before the parse result.
@visibleForTesting
Uri? storeUriFrom(String urlString) {
  if (urlString.isEmpty) return null;
  final uri = Uri.tryParse(urlString);
  if (uri == null || !uri.hasScheme) return null;
  return uri;
}

/// Opens the store, dismissing the dialog if that turns out to be impossible so
/// the user is not left holding a button that does nothing.
Future<void> _openStore(BuildContext context, Uri uri) async {
  var opened = false;
  if (await canLaunchUrl(uri)) {
    opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
  if (!opened && context.mounted) {
    Navigator.of(context).pop();
  }
}

class VersionRepository {
  VersionRepository(this._client);
  final SupabaseClient _client;

  /// The oldest build the project still allows, from the single row of
  /// `app_config` (this replaced the Go backend's `/version` endpoint). The
  /// table is world-readable, so this works before the user signs in.
  ///
  /// Left at its '1.0.0' default this blocks nobody. Raise it with
  /// `just require-app-version` only to pull a release, and only once a fixed
  /// build is downloadable from the store.
  Future<String> fetchMinRequiredVersion() async {
    final row = await _client
        .from('app_config')
        .select('min_required_version')
        .eq('id', 1)
        .single();
    return row['min_required_version'] as String? ?? '';
  }
}

@Riverpod(keepAlive: true)
VersionRepository versionRepository(VersionRepositoryRef ref) {
  return VersionRepository(ref.watch(supabaseClientProvider));
}
