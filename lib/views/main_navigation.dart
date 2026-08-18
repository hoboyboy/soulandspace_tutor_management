import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme.dart';
import '../core/localization.dart';
import '../controllers/navigation_controller.dart';
import 'home_screen.dart';
import 'activity_screen.dart';
import 'scanner_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final screens = [const HomeScreen(), const ActivityScreen(), const ScannerScreen(), const ProfileScreen()];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => ref.read(bottomNavIndexProvider.notifier).setIndex(index),
        selectedItemColor: AppTheme.softTeal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: t('nav_home', ref)),
          BottomNavigationBarItem(icon: const Icon(Icons.list_alt_outlined), label: t('nav_activity', ref)),
          BottomNavigationBarItem(icon: const Icon(Icons.qr_code_scanner), label: t('nav_scan', ref)),
          BottomNavigationBarItem(icon: const Icon(Icons.person_outline), label: t('nav_profile', ref)),
        ],
      ),
    );
  }
}
