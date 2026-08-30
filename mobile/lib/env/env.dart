import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.mobile')
abstract class Env {
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final kSupabaseUrl = _Env.kSupabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final kSupabaseAnonKey = _Env.kSupabaseAnonKey;
}
