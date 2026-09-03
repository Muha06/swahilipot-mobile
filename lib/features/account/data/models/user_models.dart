import 'package:swahilipothub/features/account/data/models/user_model_hive.dart';
import 'package:swahilipothub/features/account/domain/entities/membership.dart';
import 'package:swahilipothub/features/account/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    super.avatar,
    required super.membership,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      avatar: json['avatar'] as String?,
      membership: MembershipX.fromDb(
        json['membership'] as String? ?? Membership.communityMember.toDb,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  UserModelHive toHive() {
    return UserModelHive(
      id: id,
      email: email,
      fullName: fullName,
      avatar: avatar,
      membership: membership.toDb,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatar: avatar,
      membership: membership,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
