import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/main_layout.dart';
import '../core/localization.dart';
import '../core/theme.dart';
import '../models/student_model.dart';
import '../controllers/attendance_controller.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(attendanceProvider);
    final presentCount = students.where((s) => s.status == AttendanceStatus.present).length;
    final total = students.length;
    final percentage = total > 0 ? (presentCount / total * 100).toStringAsFixed(0) : '0';

    return MainLayout(
      showBack: true,
      titleWidget: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.check_box), const SizedBox(width: 8), Text(t('roll_call_sys', ref))]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.school, color: Colors.green),
                    SizedBox(width: 8),
                    Text('P 1專注力小組 (中一)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_statItem('$presentCount人', t('present', ref)), _statItem('${total - presentCount}人', t('absent', ref))],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(color: AppTheme.softTeal.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '${t('attendance_rate', ref)}: $percentage%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppTheme.darkTeal, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,
                childAspectRatio: 0.8,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: students.length,
              itemBuilder: (context, index) => _buildStudentCard(context, ref, students[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard(BuildContext context, WidgetRef ref, Student student) {
    Color borderColor = student.status == AttendanceStatus.present ? Colors.green : Colors.red;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(student.status == AttendanceStatus.present ? Icons.check_circle : Icons.cancel, color: borderColor, size: 36),
            const SizedBox(height: 8),
            Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(student.seat, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
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
