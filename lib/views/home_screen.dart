import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/main_layout.dart';
import '../core/localization.dart';
import '../controllers/navigation_controller.dart';
import '../core/theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showNotice = ref.watch(notificationProvider);

    return MainLayout(
      titleWidget: Row(mainAxisSize: MainAxisSize.min, children: [Text('${t('today_is', ref)} '), Text(t('date_value', ref))]),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStatsCard(context, ref),
          if (showNotice) ...[
            const SizedBox(height: 24),
            Text(
              t('pending_notices', ref),
              style: const TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFFFEBEB), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Icon(Icons.notifications_active, color: Colors.redAccent),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t('activity_reminder', ref), style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(t('summer_chinese', ref), style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('2026-08-17 14:45', style: TextStyle(fontSize: 13)),
                        const SizedBox(height: 4),
                        Text(t('click_confirm', ref), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () => ref.read(notificationProvider.notifier).dismiss(),
                    child: Text(t('i_know', ref), style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.calendar_month, color: Colors.redAccent),
              const SizedBox(width: 8),
              Text(t('today_activities', ref), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Icon(Icons.event_available, size: 60, color: Colors.grey.shade300),
                const SizedBox(height: 16),
                Text(t('no_activities', ref), style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(t('teaching_stats', ref), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const Icon(Icons.info_outline, color: Colors.grey, size: 18),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statItem('10', t('total_services', ref)),
              _statItem('2', t('likes', ref)),
              _statItem('0', t('lates', ref)),
              _statItem('0', t('leaves', ref)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String val, String label) {
    return Column(
      children: [
        Text(
          val,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.darkTeal),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
