import 'package:flutter/rendering.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swahilipothub/features/account/data/models/user_models.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/login_dto.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/signup_dto.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> signUp(SignupDto dto);

  Future<UserModel> signIn(LoginDto dto);

  Future<void> signOut();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient client;

  AuthRemoteDatasourceImpl(this.client);

  @override
  Future<UserModel> signUp(SignupDto dto) async {
    try {
      final res = await client.auth.signUp(
        email: dto.email,
        password: dto.password,
        data: {'full_name': dto.fullName},
      );

      final user = res.user;
      if (user == null) {
        throw Exception("User is null after sign up");
      }

      // Fetch Profile
      final userProfile = await client
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      final model = UserModel.fromJson(userProfile);
      return model;
    } catch (e) {
      debugPrint("Error signing up: $e");
      rethrow;
    }
  }

  @override
  Future<UserModel> signIn(LoginDto dto) async {
    try {
      final res = await client.auth.signInWithPassword(
        email: dto.email,
        password: dto.password,
      );

      final user = res.user;

      if (user == null) {
        throw Exception("User is null after sign in");
      }

      // Fetch Profile
      final userProfile = await client
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      final model = UserModel.fromJson(userProfile);
      return model;
    } catch (e) {
      debugPrint("Error signing in: $e");
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      debugPrint("Error signing out: $e");
      rethrow;
    }
  }
}
