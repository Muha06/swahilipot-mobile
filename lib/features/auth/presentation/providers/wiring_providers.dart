import 'package:hive_flutter/adapters.dart';
import 'package:riverpod/riverpod.dart';
import 'package:swahilipothub/core/constants/hive/app_hive_boxes.dart';
import 'package:swahilipothub/core/providers/supabase_client.dart';
import 'package:swahilipothub/features/account/data/models/user_model_hive.dart';
import 'package:swahilipothub/features/auth/data/datasource/auth_local_ds.dart';
import 'package:swahilipothub/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:swahilipothub/features/auth/data/repository/auth_repository_impl.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasourceImpl(ref.read(supabaseClientProvider));
});

final userBoxProvider = Provider<Box<UserModelHive>>((ref) {
  return Hive.box<UserModelHive>(AppHiveBoxes.user);
});

final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) {
  final box = ref.read(userBoxProvider);

  return AuthLocalDatasourceImpl(box);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDatasourceProvider),
    ref.read(authLocalDatasourceProvider),
  );
});
