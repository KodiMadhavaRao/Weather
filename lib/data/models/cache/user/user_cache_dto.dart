import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/mappers/cache_dto.dart';
import '../../../../domain/enums/account_type.dart';
import '../../../../domain/models/user/user.dart';
import '../../api/user/user_api_dto.dart';

part 'user_cache_dto.g.dart';

@HiveType(typeId: AppConstants.userAdapterId)
class UserCacheDto with HiveObjectMixin implements CacheDto<User, UserApiDto> {
  static String boxKey = AppConstants.userBoxKey;

  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String accountType;

  @override
  @HiveField(3)
  String? syncTime;

  @override
  @HiveField(4)
  bool? isSynced;

  UserCacheDto({
    required this.userName,
    required this.password,
    required this.accountType,
    this.syncTime,
    this.isSynced,
  });

  @override
  String get number =>
      AppConstants.userBoxKey; // change id to your unique identifier

  @override
  User toModel() => User(
        userName: userName ?? '',
        password: password ?? '',
        accountType: AccountType.values.firstWhere(
          (e) => e.name == accountType,
          orElse: () => AccountType.guest,
        ),
      );

  @override
  UserApiDto toApiDto() => UserApiDto(
        userName: userName,
        password: password,
        accountType: AccountType.values.firstWhere(
          (e) => e.name == accountType,
          orElse: () => AccountType.guest,
        ),
      );
}
