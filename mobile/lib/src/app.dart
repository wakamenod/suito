import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app_theme.dart';
import 'package:suito/src/localizations/japanese_cupertino_localizations.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/version_check.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider(navigatorKey));
    Translations.of(context);

    final versionCheck = ref.watch(versionCheckProvider);

    // FIXME アプリ起動直後の適切なタイミングを検知する方法が見つからなかった
    Future.delayed(const Duration(seconds: 3), () {
      versionCheck(navigatorKey.currentContext);
    });

    return MaterialApp.router(
      locale: LocaleSettings.currentLocale.flutterLocale,
      routerConfig: goRouter,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        JapaneseCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocaleUtils.supportedLocales,
      theme: AppTheme().create(),
    );
  }
}
