import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/routing/app_router.dart';
import 'package:suito/src/utils/version_check.dart';

class MyApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider(navigatorKey));
    final locale = TranslationProvider.of(context).flutterLocale;

    final versionCheck = ref.watch(versionCheckProvider);

    // FIXME アプリ起動直後の適切なタイミングを検知する方法が見つからなかった
    Future.delayed(const Duration(seconds: 3), () {
      versionCheck(navigatorKey.currentContext);
    });

    return MaterialApp.router(
      locale: locale,
      routerConfig: goRouter,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        locale,
      ],
      theme: ThemeData(
        fontFamily: 'NotoSerifJP',
        useMaterial3: false,
        primarySwatch: Colors.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
    );
  }
}
