import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.mobile')
abstract class Env {
  @EnviedField(varName: 'BACKEND_BASE_URL', obfuscate: true)
  static final kBackendBaseUrl = _Env.kBackendBaseUrl;

  // firebase general
  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID', obfuscate: true)
  static final kFirebaseMessagingSenderId = _Env.kFirebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID', obfuscate: true)
  static final kFirebaseProjectId = _Env.kFirebaseProjectId;

  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN', obfuscate: true)
  static final kFirebaseAuthDomain = _Env.kFirebaseAuthDomain;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET', obfuscate: true)
  static final kFirebaseStorageBucket = _Env.kFirebaseStorageBucket;

  // firebase web
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY', obfuscate: true)
  static final kFirebaseWebApiKey = _Env.kFirebaseWebApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_APP_ID', obfuscate: true)
  static final kFirebaseWebAppId = _Env.kFirebaseWebAppId;

  // firebase android
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', obfuscate: true)
  static final kFirebaseAndroidApiKey = _Env.kFirebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID', obfuscate: true)
  static final kFirebaseAndroidAppId = _Env.kFirebaseAndroidAppId;

  // firebase ios
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', obfuscate: true)
  static final kFirebaseIosApiKey = _Env.kFirebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID', obfuscate: true)
  static final kFirebaseIosAppId = _Env.kFirebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID', obfuscate: true)
  static final kFirebaseIosClientId = _Env.kFirebaseIosClientId;
}
