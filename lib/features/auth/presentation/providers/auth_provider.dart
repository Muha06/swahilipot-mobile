import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swahilipothub/features/account/domain/entities/user.dart';
import 'package:swahilipothub/features/auth/data/repository/auth_repository_impl.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/login_dto.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/signup_dto.dart';
import 'package:swahilipothub/features/auth/presentation/providers/wiring_providers.dart';

class AuthState {
  final UserEntity? user;
  final bool isLoading;
  final String? error;

  const AuthState({this.user, this.isLoading = false, this.error});

  AuthState copyWith({UserEntity? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);

    return const AuthState();
  }

  Future<void> signUp(SignupDto dto) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _repository.signUp(dto);

      state = AuthState(user: user, isLoading: false);
    } catch (e) {
      state = AuthState(
        user: state.user,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signIn(LoginDto dto) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _repository.signIn(dto);

      state = AuthState(user: user, isLoading: false);
    } catch (e) {
      state = AuthState(
        user: state.user,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _repository.signOut();

      state = const AuthState();
    } catch (e) {
      state = AuthState(
        user: state.user,
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
