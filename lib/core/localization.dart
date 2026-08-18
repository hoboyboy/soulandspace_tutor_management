import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppLanguage { en, tc, sc }

class LanguageNotifier extends Notifier<AppLanguage> {
  @override
  AppLanguage build() => AppLanguage.tc;

  void setLanguage(AppLanguage lang) => state = lang;
}

final languageProvider = NotifierProvider<LanguageNotifier, AppLanguage>(LanguageNotifier.new);

String t(String key, WidgetRef ref) {
  final lang = ref.watch(languageProvider);
  return _strings[key]?[lang] ?? key;
}

final Map<String, Map<AppLanguage, String>> _strings = {
  // Navigation
  'nav_home': {AppLanguage.en: 'Home', AppLanguage.tc: '主頁', AppLanguage.sc: '主页'},
  'nav_activity': {AppLanguage.en: 'Activity', AppLanguage.tc: '活動', AppLanguage.sc: '活动'},
  'nav_scan': {AppLanguage.en: 'Scan', AppLanguage.tc: '掃描', AppLanguage.sc: '扫描'},
  'nav_profile': {AppLanguage.en: 'Profile', AppLanguage.tc: '我的', AppLanguage.sc: '我的'},
  // Home Screen
  'today_is': {AppLanguage.en: 'Today is,', AppLanguage.tc: '今天是,', AppLanguage.sc: '今天是,'},
  'date_value': {AppLanguage.en: 'August 16, 2026', AppLanguage.tc: '2026年8月16日', AppLanguage.sc: '2026年8月16日'},
  'teaching_stats': {
    AppLanguage.en: 'Teaching Statistics (Click number to view records)',
    AppLanguage.tc: '教學統計(點擊數字查看該項紀錄)',
    AppLanguage.sc: '教学统计(点击数字查看该项纪录)',
  },
  'total_services': {AppLanguage.en: 'Total Services', AppLanguage.tc: '服務總數', AppLanguage.sc: '服务总数'},
  'likes': {AppLanguage.en: 'Likes', AppLanguage.tc: '讚好', AppLanguage.sc: '赞好'},
  'lates': {AppLanguage.en: 'Lates', AppLanguage.tc: '遲到次數', AppLanguage.sc: '迟到次数'},
  'leaves': {AppLanguage.en: 'Leaves', AppLanguage.tc: '請假次數', AppLanguage.sc: '请假次数'},
  'pending_notices': {AppLanguage.en: 'Pending Notifications', AppLanguage.tc: '待處理通知', AppLanguage.sc: '待处理通知'},
  'activity_reminder': {AppLanguage.en: 'Activity Reminder', AppLanguage.tc: '活動提醒', AppLanguage.sc: '活动提醒'},
  'summer_chinese': {AppLanguage.en: 'Summer Chinese Learning Group (P5)', AppLanguage.tc: '暑期中文科學習小組（升小五）', AppLanguage.sc: '暑期中文科学习小组（升小五）'},
  'click_confirm': {AppLanguage.en: 'Please click to confirm receipt', AppLanguage.tc: '請點擊確認收到此通知', AppLanguage.sc: '请点击确认收到此通知'},
  'i_know': {AppLanguage.en: 'Got it', AppLanguage.tc: '我知道了', AppLanguage.sc: '我知道了'},
  'today_activities': {AppLanguage.en: 'Today\'s Activities', AppLanguage.tc: '今日活動', AppLanguage.sc: '今日活动'},
  'no_activities': {AppLanguage.en: 'No activities today', AppLanguage.tc: '今天沒有活動', AppLanguage.sc: '今天没有活动'},
  // Profile Screen
  'profile_title': {AppLanguage.en: 'Profile', AppLanguage.tc: '個人檔案', AppLanguage.sc: '个人档案'},
  'org_name': {AppLanguage.en: 'Souland Space', AppLanguage.tc: '聆心教育', AppLanguage.sc: '聆心教育'},
  'org_sub': {AppLanguage.en: 'SEN Learning Support', AppLanguage.tc: '專業SEN學習支援中心', AppLanguage.sc: '专业SEN学习支援中心'},
  'e_tutor_cert': {AppLanguage.en: 'E-Tutor Cert', AppLanguage.tc: '電子導師證', AppLanguage.sc: '电子导师证'},
  'cert_no': {AppLanguage.en: 'Cert No.', AppLanguage.tc: '證號', AppLanguage.sc: '证号'},
  'activities': {AppLanguage.en: 'Activities', AppLanguage.tc: '活動', AppLanguage.sc: '活动'},
  'all_activities': {AppLanguage.en: 'All Activities', AppLanguage.tc: '所有活動', AppLanguage.sc: '所有活动'},
  'settings': {AppLanguage.en: 'Settings', AppLanguage.tc: '設定', AppLanguage.sc: '设定'},
  'update_info': {AppLanguage.en: 'Update User Info', AppLanguage.tc: '更新用戶資料', AppLanguage.sc: '更新用户资料'},
  'change_pw': {AppLanguage.en: 'Change Password', AppLanguage.tc: '更改密碼', AppLanguage.sc: '更改密码'},
  'lang_setting': {AppLanguage.en: 'Language Setting', AppLanguage.tc: '語言設定', AppLanguage.sc: '语言设定'},
  'logout': {AppLanguage.en: 'Logout', AppLanguage.tc: '登出', AppLanguage.sc: '登出'},
  'delete_account': {AppLanguage.en: 'Delete Account', AppLanguage.tc: '刪除帳號', AppLanguage.sc: '删除帐号'},
  // Scan Screen
  'scan_title': {AppLanguage.en: 'Scan to Join Activity', AppLanguage.tc: '掃描加入活動', AppLanguage.sc: '扫描加入活动'},
  'scan_hint': {AppLanguage.en: 'Aim camera at activity QR code to join quickly', AppLanguage.tc: '將相機對準活動QR碼即可快速加入管理', AppLanguage.sc: '将相机对准活动QR码即可快速加入管理'},
  'click_enable_cam': {AppLanguage.en: 'Please click the button below to enable camera', AppLanguage.tc: '請點擊下方按鈕以啟用相機', AppLanguage.sc: '请点击下方按钮以启用相机'},
  'enable_cam': {AppLanguage.en: 'Enable Camera', AppLanguage.tc: '啟用相機', AppLanguage.sc: '启用相机'},
  'manual_code': {AppLanguage.en: 'Manual Code Entry', AppLanguage.tc: '手動輸入代碼', AppLanguage.sc: '手动输入代码'},
  'scan_tip': {AppLanguage.en: 'Tip: Ensure QR code is clear, hold steady', AppLanguage.tc: '提示：確保QR碼清晰可見，保持穩定掃描', AppLanguage.sc: '提示：确保QR码清晰可见，保持稳定扫描'},
  // Activity Screen & Roll Call
  'activity_management': {AppLanguage.en: 'Activity Management', AppLanguage.tc: '活動管理', AppLanguage.sc: '活动管理'},
  'all': {AppLanguage.en: 'All', AppLanguage.tc: '全部', AppLanguage.sc: '全部'},
  'ongoing': {AppLanguage.en: 'Ongoing', AppLanguage.tc: '進行中', AppLanguage.sc: '进行中'},
  'upcoming': {AppLanguage.en: 'Upcoming', AppLanguage.tc: '即將開始', AppLanguage.sc: '即将开始'},
  'completed': {AppLanguage.en: 'Completed', AppLanguage.tc: '已完成', AppLanguage.sc: '已完成'},
  'start_roll_call': {AppLanguage.en: 'Start Roll Call', AppLanguage.tc: '開始點名', AppLanguage.sc: '开始点名'},
  'manage': {AppLanguage.en: 'Manage', AppLanguage.tc: '管理', AppLanguage.sc: '管理'},
  'roll_call_sys': {AppLanguage.en: 'Student Roll Call', AppLanguage.tc: '學生點名', AppLanguage.sc: '学生点名'},
  'present': {AppLanguage.en: 'Present', AppLanguage.tc: '出席', AppLanguage.sc: '出席'},
  'absent': {AppLanguage.en: 'Absent', AppLanguage.tc: '缺席', AppLanguage.sc: '缺席'},
  'attendance_rate': {AppLanguage.en: 'Attendance Rate', AppLanguage.tc: '出席率', AppLanguage.sc: '出席率'},
};
