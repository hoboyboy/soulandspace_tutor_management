import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soulandspace_tutor_management/core/theme.dart';

void main() {
  test('prototype palette is wired through the shared theme', () {
    expect(AppTheme.primaryOrange, const Color(0xFFF5A623));
    expect(AppTheme.deepOrange, const Color(0xFFE17A1A));
    expect(AppTheme.backgroundGrey, const Color(0xFFF4F1EA));
    expect(AppTheme.textPrimary, const Color(0xFF2E2A2A));
  });
}
