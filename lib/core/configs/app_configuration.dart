import '../env/env.dart';

abstract class AppConfiguration {
  static String baseUrl = Env.baseUrl;
  static String apiKey = Env.apiKey;
}
