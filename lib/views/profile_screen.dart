import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/main_layout.dart';
import '../core/localization.dart';
import '../core/theme.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  String _getLangName(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.en:
        return 'English';
      case AppLanguage.tc:
        return '繁體中文';
      case AppLanguage.sc:
        return '简体中文';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(
      titleWidget: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.person), const SizedBox(width: 8), Text(t('profile_title', ref))]),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppTheme.cardWhite, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(shape: BoxShape.circle, gradient: AppTheme.mainGradient),
                  child: const Icon(Icons.person, color: AppTheme.textOnPrimary, size: 36),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('vivianxxx@gmail.com', style: TextStyle(color: AppTheme.textSecondary)),
                    SizedBox(height: 4),
                    Text('9xxxxxx1', style: TextStyle(color: AppTheme.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.staffCardBackground, AppTheme.primaryOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: AppTheme.shadowColor, blurRadius: 10, offset: Offset(0, 5))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('org_name', ref),
                          style: const TextStyle(color: AppTheme.textOnPrimary, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(t('org_sub', ref), style: const TextStyle(color: AppTheme.staffCardSubtext, fontSize: 12)),
                      ],
                    ),
                    Chip(
                      label: Text(t('e_tutor_cert', ref), style: const TextStyle(color: AppTheme.textOnLightAccent, fontSize: 12)),
                      backgroundColor: AppTheme.softOrange,
                      side: BorderSide.none,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Center(
                  child: Column(
                    children: [
                      Text(
                        t('org_name', ref),
                        style: const TextStyle(color: AppTheme.textOnPrimary, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Text(t('org_sub', ref), style: const TextStyle(color: AppTheme.staffCardSubtext, fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(t('cert_no', ref), style: const TextStyle(color: AppTheme.staffCardSubtext, fontSize: 12)),
                const Text('SDYT-2026-000', style: TextStyle(color: AppTheme.textOnPrimary, fontSize: 18, letterSpacing: 2)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildStatsCard(context, ref),
          _buildSectionTitle(t('activities', ref)),
          _buildMenuBlock([_buildTile(Icons.menu_book, t('all_activities', ref))]),
          _buildSectionTitle(t('settings', ref)),
          _buildMenuBlock([
            _buildTile(Icons.edit, t('update_info', ref)),
            const Divider(height: 1),
            _buildTile(Icons.lock, t('change_pw', ref)),
            const Divider(height: 1),
            _buildTile(
              Icons.language,
              t('lang_setting', ref),
              trailing: Text(_getLangName(ref.watch(languageProvider)), style: const TextStyle(color: AppTheme.textSecondary)),
            ),
          ]),
          const SizedBox(height: 16),
          _buildMenuBlock([
            _buildTile(Icons.door_back_door, t('logout', ref), color: AppTheme.dangerRed, trailing: const SizedBox.shrink()),
          ], color: AppTheme.dangerSoft),
          const SizedBox(height: 16),
          _buildMenuBlock([_buildTile(Icons.close, t('delete_account', ref), color: AppTheme.dangerRed, trailing: const SizedBox.shrink())]),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text('Version 1.0.33', style: TextStyle(color: AppTheme.textSecondary)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(left: 8, bottom: 8, top: 16),
    child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  );

  Widget _buildMenuBlock(List<Widget> children, {Color color = AppTheme.cardWhite}) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(children: children),
    );
  }

  Widget _buildTile(IconData icon, String title, {Widget? trailing, Color color = AppTheme.textPrimary}) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        tileColor: AppTheme.cardWhite,
        splashColor: AppTheme.primaryOrange.withValues(alpha: 0.12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(color: color, fontWeight: FontWeight.normal),
        ),
        trailing: trailing ?? const Icon(Icons.arrow_forward, size: 18, color: AppTheme.textPrimary),
        onTap: () {},
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppTheme.shadowColor, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(t('teaching_stats', ref), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              ),
              const Icon(Icons.info_outline, color: AppTheme.textSecondary, size: 18),
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
        Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
      ],
    );
  }
}
