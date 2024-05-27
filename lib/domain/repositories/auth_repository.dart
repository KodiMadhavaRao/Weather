import '../../data/models/result/data_state.dart';
import '../enums/account_type.dart';
import '../models/user/user.dart';
import '../usecases/auth/auth_usecases.dart';

abstract interface class AuthRepository {
  Future<DataState<User>> login(LoginUseCaseParams useCaseParms);
  Future<void> logout(AccountType accountType);
}
