import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme.dart';
import 'localization.dart';

class MainLayout extends ConsumerWidget {
  final Widget titleWidget;
  final Widget child;
  final bool showBack;

  const MainLayout({super.key, required this.titleWidget, required this.child, this.showBack = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: AppTheme.mainGradient,
              boxShadow: [BoxShadow(color: Color(0x1A000000), blurRadius: 14, offset: Offset(0, 6))],
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (showBack)
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(Icons.arrow_back, color: AppTheme.textOnPrimary),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                if (showBack) const SizedBox(width: 8),
                                DefaultTextStyle(
                                  style: const TextStyle(color: AppTheme.textOnPrimary, fontSize: 20, fontWeight: FontWeight.bold),
                                  child: IconTheme(
                                    data: const IconThemeData(color: AppTheme.textOnPrimary, size: 24),
                                    child: titleWidget,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppTheme.deepOrange,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.textOnPrimary.withValues(alpha: 0.35), width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<AppLanguage>(
                            value: currentLang,
                            dropdownColor: AppTheme.deepOrange,
                            icon: const Icon(Icons.arrow_drop_down, color: AppTheme.textOnPrimary),
                            style: const TextStyle(color: AppTheme.textOnPrimary, fontWeight: FontWeight.bold),
                            items: const [
                              DropdownMenuItem(value: AppLanguage.en, child: Text('EN')),
                              DropdownMenuItem(value: AppLanguage.tc, child: Text('繁體')),
                              DropdownMenuItem(value: AppLanguage.sc, child: Text('简体')),
                            ],
                            onChanged: (val) {
                              if (val != null) ref.read(languageProvider.notifier).setLanguage(val);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 600), child: child),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
