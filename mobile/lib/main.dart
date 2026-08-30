import 'package:flutter/material.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:suito/env/env.dart';
import 'package:suito/i18n/translations.g.dart';
import 'package:suito/src/app_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Supabase (Auth + PostgREST client). Session is persisted to
  // local storage and restored automatically on the next launch.
  await Supabase.initialize(
    url: Env.kSupabaseUrl,
    anonKey: Env.kSupabaseAnonKey,
  );
  // turn off the # in the URLs on the web
  usePathUrlStrategy();
  // create an app bootstrap instance
  final appBootstrap = AppBootstrap();
  // create a container configured with all the "fake" repositories
  final container = await appBootstrap.createFakeDioProviderContainer();
  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget(container: container);
  // Localization
  LocaleSettings.useDeviceLocale();
  // start the app
  runApp(root);
}
