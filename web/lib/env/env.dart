import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.mobile')
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String kSupabaseUrl = _Env.kSupabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final String kSupabaseAnonKey = _Env.kSupabaseAnonKey;
}
