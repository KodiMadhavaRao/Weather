import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/states/core/app_state.dart';
import '../../../domain/states/user_state.dart';
import '../../../domain/usecases/user/user_usecases.dart';
import 'app_state_provider.dart';

part 'user_state_provider.g.dart';

@Riverpod(keepAlive: true)
class UserStateNotifier extends _$UserStateNotifier {
  late final UpdateUser _updateUserUseCase =
      ref.watch(updateUserUseCaseProvider);

  @override
  UserState build() {
    return switch (ref.watch(appStateNotifierProvider)) {
      AppStateAuthenticated(user: var user) => UserStateAvailable(user: user),
      _ => const UserStateNotAvailable()
    };
  }
}
