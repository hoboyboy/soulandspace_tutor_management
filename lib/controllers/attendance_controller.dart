import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student_model.dart';

class AttendanceNotifier extends Notifier<List<Student>> {
  @override
  List<Student> build() {
    // Initial state setup goes here
    return [
      Student(id: '1', name: '胡嘉恩', seat: '4A', status: AttendanceStatus.present),
      Student(id: '2', name: '黃梓謙', seat: '4A', status: AttendanceStatus.present),
      Student(id: '3', name: '關雯欣', seat: '4C', status: AttendanceStatus.present),
      Student(id: '4', name: '唐芯妍', seat: '4C', status: AttendanceStatus.present),
    ];
  }

  void updateStatus(String id, AttendanceStatus newStatus) {
    state = [
      for (final student in state)
        if (student.id == id) student.copyWith(status: newStatus) else student,
    ];
  }
}

final attendanceProvider = NotifierProvider<AttendanceNotifier, List<Student>>(AttendanceNotifier.new);
