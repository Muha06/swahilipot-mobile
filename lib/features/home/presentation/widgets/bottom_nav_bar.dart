import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:swahilipothub/features/home/presentation/index_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabsIndexProvider);

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        ref.read(tabsIndexProvider.notifier).state = index;
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(HugeIconsStroke.home01, size: 24),
          selectedIcon: Icon(HugeIconsSolid.home01),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(HugeIconsStroke.tv01, size: 24),
          selectedIcon: Icon(HugeIconsSolid.tv01, size: 24),
          label: 'Programs',
        ),
        NavigationDestination(
          icon: Icon(HugeIconsStroke.calendar03, size: 24),
          selectedIcon: Icon(HugeIconsSolid.calendar03, size: 24),
          label: 'Events',
        ),
        NavigationDestination(
          icon: Icon(HugeIconsStroke.radio, size: 24),
          selectedIcon: Icon(HugeIconsSolid.radio, size: 24),
          label: 'FM',
        ),
        NavigationDestination(
          icon: Icon(HugeIconsStroke.user, size: 24),
          selectedIcon: Icon(HugeIconsSolid.user, size: 24),
          label: 'Account',
        ),
      ],
    );
  }
}
