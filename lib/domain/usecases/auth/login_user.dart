part of 'auth_usecases.dart';

@Riverpod(keepAlive: true)
LoginUser loginUserUseCase(LoginUserUseCaseRef ref) {
  return LoginUser(ref.watch(authRepositoryProvider));
}

class LoginUser extends UseCase<DataState<User>, LoginUseCaseParams> {
  final AuthRepository _authRepository;

  ///Login User Use Case
  LoginUser(this._authRepository);

  /// Callable class method
  @override
  Future<DataState<User>> call(LoginUseCaseParams loginUseCaseParams) async {
    return _authRepository.login(loginUseCaseParams);
  }
}

class LoginUseCaseParams {
  AccountType accountType;
  String userName;
  String password;

  LoginUseCaseParams(this.accountType, this.userName, this.password);
}
