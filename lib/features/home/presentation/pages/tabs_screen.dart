import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swahilipothub/features/FM/presentation/pages/fm_page.dart';
import 'package:swahilipothub/features/account/presentation/pages/account_page.dart';
import 'package:swahilipothub/features/events/presentation/pages/events_page.dart';
import 'package:swahilipothub/features/home/presentation/index_provider.dart';
import 'package:swahilipothub/features/home/presentation/pages/home_page.dart';
import 'package:swahilipothub/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:swahilipothub/features/programs/presentation/pages/programs_page.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  final List<Widget> pages = [
    const HomePage(),
    const ProgramsPage(),
    const EventsPage(),
    const FmPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabsIndex = ref.watch(tabsIndexProvider);

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: IndexedStack(index: tabsIndex, children: pages),
    );
  }
}
