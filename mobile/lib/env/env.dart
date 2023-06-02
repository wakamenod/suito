import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.mobile')
abstract class Env {
  @EnviedField(varName: 'BACKEND_BASE_URL')
  static const kBackendBaseUrl = _Env.kBackendBaseUrl;

  // firebase general
  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID')
  static const kFirebaseMessagingSenderId = _Env.kFirebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID')
  static const kFirebaseProjectId = _Env.kFirebaseProjectId;

  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN')
  static const kFirebaseAuthDomain = _Env.kFirebaseAuthDomain;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET')
  static const kFirebaseStorageBucket = _Env.kFirebaseStorageBucket;

  // firebase web
  @EnviedField(varName: 'FIREBASE_WEB_API_KEY')
  static const kFirebaseWebApiKey = _Env.kFirebaseWebApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_APP_ID')
  static const kFirebaseWebAppId = _Env.kFirebaseWebAppId;

  // firebase android
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY')
  static const kFirebaseAndroidApiKey = _Env.kFirebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID')
  static const kFirebaseAndroidAppId = _Env.kFirebaseAndroidAppId;

  // firebase ios
  @EnviedField(varName: 'FIREBASE_IOS_API_KEY')
  static const kFirebaseIosApiKey = _Env.kFirebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID')
  static const kFirebaseIosAppId = _Env.kFirebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID')
  static const kFirebaseIosClientId = _Env.kFirebaseIosClientId;
}
