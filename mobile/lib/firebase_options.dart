// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:suito/env/env.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: Env.kFirebaseWebApiKey,
    appId: Env.kFirebaseWebAppId,
    messagingSenderId: Env.kFirebaseMessagingSenderId,
    projectId: Env.kFirebaseProjectId,
    authDomain: Env.kFirebaseAuthDomain,
    storageBucket: Env.kFirebaseStorageBucket,
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: Env.kFirebaseAndroidApiKey,
    appId: Env.kFirebaseAndroidAppId,
    messagingSenderId: Env.kFirebaseMessagingSenderId,
    projectId: Env.kFirebaseProjectId,
    storageBucket: Env.kFirebaseStorageBucket,
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: Env.kFirebaseIosApiKey,
    appId: Env.kFirebaseIosAppId,
    messagingSenderId: Env.kFirebaseMessagingSenderId,
    projectId: Env.kFirebaseProjectId,
    storageBucket: Env.kFirebaseStorageBucket,
    iosClientId: Env.kFirebaseIosClientId,
    iosBundleId: 'net.wakamenod.suito',
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: Env.kFirebaseIosApiKey,
    appId: Env.kFirebaseIosAppId,
    messagingSenderId: Env.kFirebaseMessagingSenderId,
    projectId: Env.kFirebaseProjectId,
    storageBucket: Env.kFirebaseStorageBucket,
    iosClientId: Env.kFirebaseIosClientId,
    iosBundleId: 'net.wakamenod.suito',
  );
}
