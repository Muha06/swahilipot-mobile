import 'package:swahilipothub/features/account/domain/entities/membership.dart';

class UserEntity {
  final String id;
  final String email;
  final String fullName;
  final String? avatar;
  final Membership membership;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatar,
    required this.membership,
    required this.createdAt,
    required this.updatedAt,
  });
}
