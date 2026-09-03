import 'package:hive/hive.dart';
import 'package:swahilipothub/features/account/data/models/user_model_hive.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUser(UserModelHive user);

  UserModelHive? getUser();

  Future<void> deleteUser();

  bool hasUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final Box<UserModelHive> userBox;

  AuthLocalDatasourceImpl(this.userBox);

  static const String key = 'current_user';

  @override
  Future<void> saveUser(UserModelHive user) async {
    await userBox.put(key, user);
  }

  @override
  UserModelHive? getUser() {
    return userBox.get(key);
  }

  @override
  Future<void> deleteUser() async {
    await userBox.delete(key);
  }

  @override
  bool hasUser() {
    return userBox.containsKey(key);
  }
}
