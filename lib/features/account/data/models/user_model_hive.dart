import 'package:hive/hive.dart';
 import 'package:swahilipothub/features/account/domain/entities/membership.dart';
import 'package:swahilipothub/features/account/domain/entities/user.dart';

part 'user_model_hive.g.dart';

@HiveType(typeId: 0)
class UserModelHive extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String? avatar;

  @HiveField(4)
  final String membership;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final DateTime updatedAt;

  UserModelHive({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatar,
    required this.membership,
    required this.createdAt,
    required this.updatedAt,
  });

 

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatar: avatar,
      membership: MembershipX.fromDb(membership),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
