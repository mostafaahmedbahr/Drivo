import 'package:flutter/material.dart';

class DateTimePickerHelper {
  /// دالة لاختيار التاريخ
  static Future<DateTime?> selectDate(BuildContext context, {DateTime? initialDate}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (!context.mounted) return null;
    return pickedDate; // ترجع التاريخ اللي المستخدم اختاره
  }

  /// دالة لاختيار الوقت
  static Future<TimeOfDay?> selectTime(BuildContext context, {TimeOfDay? initialTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    if (!context.mounted) return null;
    return pickedTime; // ترجع الوقت اللي المستخدم اختاره
  }
}
