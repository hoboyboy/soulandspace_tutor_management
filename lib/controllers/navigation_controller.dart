import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

final bottomNavIndexProvider = NotifierProvider<BottomNavNotifier, int>(BottomNavNotifier.new);

class NotificationNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void dismiss() => state = false;
}

final notificationProvider = NotifierProvider<NotificationNotifier, bool>(NotificationNotifier.new);
