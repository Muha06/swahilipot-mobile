import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swahilipothub/core/constants/hive/app_hive_boxes.dart';
import 'package:swahilipothub/core/keys/naigation_keys.dart';
import 'package:swahilipothub/core/theme/app_dark_theme.dart';
import 'package:swahilipothub/core/theme/app_light_theme.dart';
import 'package:swahilipothub/features/account/data/models/user_model_hive.dart';
import 'package:swahilipothub/features/auth/presentation/pages/login_page.dart';
import 'package:swahilipothub/features/auth/presentation/providers/current_user_provider.dart';
import 'package:swahilipothub/features/home/presentation/pages/home_page.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
  );

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelHiveAdapter());

  await Hive.openBox<UserModelHive>(AppHiveBoxes.user);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final hasUserAsync = ref.watch(hasUserProvider);
    debugPrint("Has user: ${hasUserAsync.asData?.value ?? 'Loading...'}");

    return ToastificationWrapper(
      child: MaterialApp(
        title: 'SwahiliPot Hub',
        debugShowCheckedModeBanner: false,
        theme: appLightTheme(),
        darkTheme: appDarkTheme(),
        themeMode: ThemeMode.system,
        navigatorKey: navigatorKey,
        home: hasUserAsync.when(
          data: (hasUser) => hasUser ? const HomePage() : const LoginPage(),
          error: (_, _) => const LoginPage(),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
