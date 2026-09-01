// The forced-update check is an emergency brake: it blocks only builds older
// than `app_config.min_required_version`, which sits at its '1.0.0' default
// unless a release has to be pulled. Two properties matter enough to pin here.
//
// It must fail open. The dialog is deliberately inescapable
// (`barrierDismissible: false` plus a `WillPopScope` that refuses every pop),
// so anything ambiguous -- an unreadable version, a store URL that was never
// configured -- has to resolve to "let the user through", not "trap them".
//
// And it must order versions numerically. A string comparison would rank
// `1.10.0` below `1.9.0` and block every user of the newer build.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/utils/version_check.dart';

import '../mocks.dart';

final _appInfo = PackageInfo(
  appName: 'suito',
  packageName: 'net.wakamenod.suito',
  version: '1.0.2',
  buildNumber: '11',
);

/// Pumps a screen whose button runs the version check against [minRequired],
/// with [storeUrl] standing in for the platform's `--dart-define`.
Future<void> _pumpAndCheck(
  WidgetTester tester, {
  required String minRequired,
  String storeUrl = 'market://details?id=net.wakamenod.suito',
}) async {
  final repository = MockVersionRepository();
  when(repository.fetchMinRequiredVersion).thenAnswer((_) async => minRequired);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        versionRepositoryProvider.overrideWithValue(repository),
        packageInfoProvider.overrideWithValue(Future.value(_appInfo)),
        storeUrlProvider.overrideWithValue(storeUrl),
      ],
      child: MaterialApp(
        home: Consumer(
          builder: (context, ref, _) => Scaffold(
            body: ElevatedButton(
              onPressed: () => ref.read(versionCheckProvider)(context),
              child: const Text('check'),
            ),
          ),
        ),
      ),
    ),
  );

  await tester.tap(find.text('check'));
  await tester.pumpAndSettle();
}

Finder get _dialog => find.text(t.general.version.updateAlertTitle);

void main() {
  // The launch-once/throttle state is a library global, so each test has to
  // start from a clean one or only the first would reach the network.
  setUp(resetVersionCheckState);

  group('compareVersions', () {
    test('orders segments numerically, not as strings', () {
      // The whole reason for a comparator: '1.10.0'.compareTo('1.9.0') is
      // negative, which would block everyone on the newer build.
      expect(compareVersions('1.10.0', '1.9.0'), greaterThan(0));
      expect(compareVersions('1.9.0', '1.10.0'), lessThan(0));
    });

    test('treats missing trailing segments as zero', () {
      expect(compareVersions('1.0', '1.0.0'), 0);
      expect(compareVersions('1.0.1', '1.0'), greaterThan(0));
    });

    test('reports equality', () {
      expect(compareVersions('1.0.2', '1.0.2'), 0);
    });

    test('returns null for anything that is not a dotted integer', () {
      for (final bad in ['', 'v1.0.2', '1.0.2-beta', '1.0.x', '1..0']) {
        expect(compareVersions(bad, '1.0.0'), isNull, reason: bad);
        expect(compareVersions('1.0.0', bad), isNull, reason: bad);
      }
    });
  });

  group('isUpdateRequired', () {
    test('blocks a build below the floor', () {
      expect(isUpdateRequired(appVersion: '1.0.1', minRequired: '1.0.2'), true);
    });

    test('lets the floor itself and anything newer through', () {
      expect(isUpdateRequired(appVersion: '1.0.2', minRequired: '1.0.2'), false);
      expect(isUpdateRequired(appVersion: '1.0.3', minRequired: '1.0.2'), false);
    });

    test('lets a build through when the floor is the untouched default', () {
      // The hosted row nobody has ever edited must never block anyone.
      expect(isUpdateRequired(appVersion: '1.0.2', minRequired: '1.0.0'), false);
    });

    test('fails open on an unparseable floor', () {
      for (final bad in ['', 'unknown', 'v2']) {
        expect(isUpdateRequired(appVersion: '1.0.2', minRequired: bad), false,
            reason: bad);
      }
    });
  });

  group('storeUriFrom', () {
    test('returns null for an unset dart-define', () {
      // Uri.tryParse('') returns an empty Uri rather than null, so the
      // emptiness has to be caught before the parse.
      expect(storeUriFrom(''), isNull);
    });

    test('returns null for a value with no scheme', () {
      expect(storeUriFrom('details?id=net.wakamenod.suito'), isNull);
    });

    test('parses the Play Store deep link', () {
      final uri = storeUriFrom('market://details?id=net.wakamenod.suito');

      expect(uri, isNotNull);
      expect(uri!.scheme, 'market');
    });
  });

  group('the forced-update dialog', () {
    testWidgets('stays away at the default floor', (tester) async {
      await _pumpAndCheck(tester, minRequired: '1.0.0');

      expect(_dialog, findsNothing);
    });

    testWidgets('stays away when the app is newer than the floor',
        (tester) async {
      await _pumpAndCheck(tester, minRequired: '1.0.1');

      expect(_dialog, findsNothing);
    });

    testWidgets('offers the store when the app is below the floor',
        (tester) async {
      await _pumpAndCheck(tester, minRequired: '1.0.3');

      expect(_dialog, findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
      expect(find.text(t.general.version.updateAlertClose), findsNothing);
    });

    testWidgets('can be dismissed when no store URL is configured',
        (tester) async {
      await _pumpAndCheck(tester, minRequired: '1.0.3', storeUrl: '');

      expect(_dialog, findsOneWidget);
      expect(find.text('OK'), findsNothing);

      await tester.tap(find.text(t.general.version.updateAlertClose));
      await tester.pumpAndSettle();

      // Without this the dialog swallows every pointer event and the app is
      // unusable until it is reinstalled.
      expect(_dialog, findsNothing);
    });

    testWidgets('says nothing when the lookup fails', (tester) async {
      final repository = MockVersionRepository();
      when(repository.fetchMinRequiredVersion)
          .thenThrow(Exception('offline'));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            versionRepositoryProvider.overrideWithValue(repository),
            packageInfoProvider.overrideWithValue(Future.value(_appInfo)),
            storeUrlProvider.overrideWithValue(''),
          ],
          child: MaterialApp(
            home: Consumer(
              builder: (context, ref, _) => Scaffold(
                body: ElevatedButton(
                  onPressed: () => ref.read(versionCheckProvider)(context),
                  child: const Text('check'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('check'));
      await tester.pumpAndSettle();

      // An unreachable project must not look like an out-of-date app.
      expect(_dialog, findsNothing);
    });
  });

  group('the throttle', () {
    testWidgets('does not re-fetch on a second call', (tester) async {
      final repository = MockVersionRepository();
      when(repository.fetchMinRequiredVersion).thenAnswer((_) async => '1.0.0');

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            versionRepositoryProvider.overrideWithValue(repository),
            packageInfoProvider.overrideWithValue(Future.value(_appInfo)),
            storeUrlProvider.overrideWithValue(''),
          ],
          child: MaterialApp(
            home: Consumer(
              builder: (context, ref, _) => Scaffold(
                body: ElevatedButton(
                  onPressed: () => ref.read(versionCheckProvider)(context),
                  child: const Text('check'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('check'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('check'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('check'));
      await tester.pumpAndSettle();

      // This is the point of moving the call out of go_router's `redirect`:
      // repeated triggers cost nothing until the interval is up.
      verify(repository.fetchMinRequiredVersion).called(1);
    });
  });
}
