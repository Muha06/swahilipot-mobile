import 'package:swahilipothub/features/account/domain/entities/user.dart';
import 'package:swahilipothub/features/auth/data/datasource/auth_local_ds.dart';
import 'package:swahilipothub/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/login_dto.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/signup_dto.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp(SignupDto dto);

  Future<UserEntity> signIn(LoginDto dto);

  Future<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.remoteDatasource, this.localDatasource);

  @override
  Future<UserEntity> signUp(SignupDto dto) async {
    final userModel = await remoteDatasource.signUp(dto);

    // Cache user model
    final hiveModel = userModel.toHive();
    await localDatasource.saveUser(hiveModel);

    return userModel.toEntity();
  }

  @override
  Future<UserEntity> signIn(LoginDto dto) async {
    final userModel = await remoteDatasource.signIn(dto);

    // Cache user model
    final hiveModel = userModel.toHive();
    await localDatasource.saveUser(hiveModel);

    return userModel.toEntity();
  }

  @override
  Future<void> signOut() async {
    await remoteDatasource.signOut();

    // Clear cached user model
    await localDatasource.deleteUser();
  }
}
