import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme.dart';
import 'views/main_navigation.dart';

void main() {
  runApp(const ProviderScope(child: TutorApp()));
}

class TutorApp extends StatelessWidget {
  const TutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Souland Space Tutor App', debugShowCheckedModeBanner: false, theme: AppTheme.themeData, home: const MainNavigationScreen());
  }
}
