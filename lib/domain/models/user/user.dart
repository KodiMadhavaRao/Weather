import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/cache/user/user_cache_dto.dart';
import '../../enums/account_type.dart';

part 'user.freezed.dart';

@freezed
class User with _$User implements UICacheModel<UserCacheDto> {
  const factory User({
    required String userName,
    required String password,
    required AccountType accountType,
  }) = _User;
  const User._();

  @override
  UserCacheDto toCacheDto() => UserCacheDto(
        userName: userName,
        password: password,
        accountType: accountType.name,
      );
}
