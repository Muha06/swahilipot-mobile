import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swahilipothub/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:swahilipothub/features/auth/domain/entities/dtos/signup_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  late SupabaseClient client;
  late AuthRemoteDatasource datasource;

  await dotenv.load(fileName: '.env');

  setUpAll(() async {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
    );

    client = Supabase.instance.client;
    datasource = AuthRemoteDatasourceImpl(client);
  });

  tearDown(() async {
    await client.auth.signOut();
  });

  test(
    'signUp creates auth user and profile through database trigger',
    () async {
      final email =
          'integration_${DateTime.now().millisecondsSinceEpoch}@example.com';

      const password = 'TestPassword123!';
      const fullName = 'Integration Test User';

      final dto = SignupDto(
        email: email,
        password: password,
        fullName: fullName,
      );

      await datasource.signUp(dto);

      final authUser = client.auth.currentUser;

      expect(authUser, isNotNull);
      expect(authUser!.email, email);

      // FETCH
      final profile = await client
          .from('users')
          .select()
          .eq('id', authUser.id)
          .single();

      expect(profile['id'], authUser.id);
      expect(profile['email'], email);
      expect(profile['full_name'], fullName);
      expect(profile['membership'], 'communityMember');
    },
  );
}
