import 'dart:async';

import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

import '../../../main_importants.dart';

class DateTimePickerHelper {
  /// 🏛 اختيار تاريخ ميلادي — يفتح على اليوم ويحفظه عند OK
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();

    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (!context.mounted) return null;

    // المستخدم اختار تاريخ جديد
    if (result != null) return result;

    // المستخدم ضغط OK بدون اختيار؟ (في DatePicker مستحيل غير بالاختيار)
    return today;
  }

  /// 🕌 اختيار تاريخ هجري — نفس منطق الميلادي
  static Future<JHijri?> pickHijri(BuildContext context) async {

    final JHijri today = JHijri.now();
    JHijri selected = today;

    final JPickerValue? result = await showGlobalDatePicker(
      context: context,
      startDate: JDateModel(jhijri: JHijri(fYear: 1357, fMonth: 1, fDay: 1)),
      selectedDate: JDateModel(jhijri: today),
      endDate: JDateModel(jhijri: JHijri(fYear: 1524, fMonth: 12, fDay: 29)),
      pickerMode: DatePickerMode.day,
      textDirection: TextDirection.rtl,

      okButtonText: "حفظ",
      cancelButtonText: "عودة",

      primaryColor: AppColors.orange,
      calendarTextColor: Colors.black,
      backgroundColor: Colors.white,
      borderRadius: const Radius.circular(10),

      onOk: (value) {
        selected = value.jhijri;
        Navigator.pop(context);
      },

      onCancel: () {
        Navigator.pop(context);
        selected = today;
      },
    );

    // لو قفل الدايالوج من برا
    if (result == null) return today;

    return selected;
  }

  /// دالة لاختيار الوقت
  static Future<TimeOfDay?> selectTime(BuildContext context, {TimeOfDay? initialTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    if (!context.mounted) return null;
    return pickedTime;
  }

}