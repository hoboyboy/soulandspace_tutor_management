enum AttendanceStatus { present, absent, excused }

class Student {
  final String id;
  final String name;
  final String seat;
  final AttendanceStatus status;
  Student({required this.id, required this.name, required this.seat, required this.status});

  Student copyWith({AttendanceStatus? status}) {
    return Student(id: id, name: name, seat: seat, status: status ?? this.status);
  }
}
