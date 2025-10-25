import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/helpers/date_and_time.dart';

class ChooseYourCar extends StatefulWidget {
  const ChooseYourCar({super.key});

  @override
  State<ChooseYourCar> createState() => _ChooseYourCarState();
}

class _ChooseYourCarState extends State<ChooseYourCar> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.chooseYourCarNow.tr(), style: AppStyles.semiBold18Black),
              verticalSpace(12),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                hintText: LocaleKeys.location.tr(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(SvgImages.location),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              activeColor: AppColors.orange,
              checkColor: AppColors.whiteColor,
              fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return AppColors.orange; // لون الخلفية عند التحديد
                }
                return Colors.transparent; // لون الخلفية عند عدم التحديد
              }),
              side: const BorderSide(
                color: AppColors.greyColor1, // لون الحواف الرمادية
                width: 2.0,
              ),
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Text(LocaleKeys.chooseYourCarNow.tr(), style: AppStyles.semiBold14Gray1),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: LocaleKeys.dateOfReceipt.tr(),
                  onPressed: () async {
                    // 1️⃣ المستخدم يختار التاريخ
                    final selectedDate = await DateTimePickerHelper.selectDate(context);
                    if (selectedDate != null) {
                      print("📅 التاريخ المختار: $selectedDate");

                      // 2️⃣ بعد اختيار التاريخ مباشرة، نفتح اختيار الوقت
                      final selectedTime = await DateTimePickerHelper.selectTime(context);
                      if (selectedTime != null) {
                        print("⏰ الوقت المختار: ${selectedTime.format(context)}");

                        // 3️⃣ لو عايز تجمع التاريخ والوقت معًا في DateTime
                        final combinedDateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );

                        print("📆 التاريخ والوقت الكامل: $combinedDateTime");

                        // هنا تقدر تحفظ القيمة أو تحدث state
                        // setState(() { _selectedDateTime = combinedDateTime; });
                      }
                    }
                  },
                ),
              ),
              horizontalSpace(12),
              Expanded(child: CustomTextFormField(
                onPressed: () async {
                  final selectedTime = await DateTimePickerHelper.selectTime(context);
                  if (selectedTime != null) {
                    print("📅 الوقت المختار: $selectedTime");
                    // تقدر تحدث الـ state هنا أو تحفظ القيمة
                  }
                },
                hintText: LocaleKeys.timeOfReceipt.tr(),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
              btnText:
              Text(LocaleKeys.next.tr(),style: AppStyles.semiBold16White,),
              onPressed: (){
                context.pushNamed(Routes.allCarsScreen);
              },
          ),
        ),
      ],
    );
  }
}