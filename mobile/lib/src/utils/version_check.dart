import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/src/data/supabase_provider.dart';
import 'package:url_launcher/url_launcher.dart';

part 'version_check.g.dart';

final packageInfoProvider = Provider<Future<PackageInfo>>((ref) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo;
});

final versionCheckProvider = Provider<FutureOr Function(BuildContext?)>((ref) {
  final versionRepository = ref.watch(versionRepositoryProvider);
  final packageInfo = ref.watch(packageInfoProvider);
  return (context) => _checkVersion(context, versionRepository, packageInfo);
});

bool _isCheckVersionRunning = false;

Future<void> _checkVersion(
    BuildContext? context,
    VersionRepository versionRepository,
    Future<PackageInfo> packageInfoFuture) async {
  if (_isCheckVersionRunning) return;

  _isCheckVersionRunning = true;
  try {
    if (context == null) return;
    final serverVersion = await versionRepository.fetchVersion();
    final packageInfo = await packageInfoFuture;
    if (context.mounted) {
      if (_isUpdateRequired(serverVersion, packageInfo)) {
        showDialog(
          barrierDismissible: false,
          context: context, // use this context to show dialog
          builder: (context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text(t.general.version.updateAlertTitle),
                content: Text(t.general.version.updateAlertContent(
                    serverVersion: serverVersion,
                    appVersion: packageInfo.version)),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('OK'),
                    onPressed: () {
                      _launchURL();
                    },
                  ),
                ],
              ),
            );
          },
        );
      }
    }
  } finally {
    _isCheckVersionRunning = false;
  }
}

void _launchURL() async {
  // TODO ios
  final urlString =
      Platform.isAndroid ? const String.fromEnvironment('androidStoreURL') : '';

  final uri = Uri.tryParse(urlString);
  if (uri == null) return;

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $uri';
  }
}

bool _isUpdateRequired(String serverVersion, PackageInfo packageInfo) {
  return serverVersion != packageInfo.version;
}

class VersionRepository {
  VersionRepository(this._client);
  final SupabaseClient _client;

  /// The published version, from the single row of `app_config` (this replaced
  /// the Go backend's `/version` endpoint). The table is world-readable, so
  /// this works before the user signs in.
  Future<String> fetchVersion() async {
    final row = await _client
        .from('app_config')
        .select('latest_version')
        .eq('id', 1)
        .single();
    return row['latest_version'] as String? ?? '';
  }
}

@Riverpod(keepAlive: true)
VersionRepository versionRepository(VersionRepositoryRef ref) {
  return VersionRepository(ref.watch(supabaseClientProvider));
}
