import 'package:riverpod/riverpod.dart';
import 'package:swahilipothub/features/account/domain/entities/user.dart';
import 'package:swahilipothub/features/auth/presentation/providers/wiring_providers.dart';

final currentUserProvider = Provider<UserEntity?>((ref) {
  final local = ref.read(authLocalDatasourceProvider);

  return local.getUser()?.toEntity();
});

final hasUserProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});
