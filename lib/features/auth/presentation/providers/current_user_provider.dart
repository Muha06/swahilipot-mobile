import 'package:riverpod/riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swahilipothub/features/account/domain/entities/user.dart';
import 'package:swahilipothub/features/auth/presentation/providers/wiring_providers.dart';

final currentUserProvider = FutureProvider<UserEntity?>((ref) async {
  ref.watch(hasUserProvider); // Watch the hasUserProvider to trigger a rebuild
  final local = ref.read(authLocalDatasourceProvider);

  final localUser = local.getUser();

  return localUser?.toEntity();
});

final hasUserProvider = StreamProvider<bool>((ref) {
  final auth = Supabase.instance.client.auth;

  return auth.onAuthStateChange.map((data) => data.session != null);
});
