import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_service_providers.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import '../data/repositories_impl/weather_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'repositories/user_repository.dart';
import 'repositories/weather_repository.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(ref.watch(userRemoteDataSourceProvider),
      ref.watch(userLocalDataSourceProvider));
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(ref.watch(userRepositoryProvider));
}

@Riverpod(keepAlive: true)
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepositoryImpl(ref.watch(weatherRemoteDataSourceProvider),
      ref.watch(weatherLocalDataSourceProvider));
}
