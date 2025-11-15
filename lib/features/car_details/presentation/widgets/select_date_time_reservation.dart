import 'package:easy_localization/easy_localization.dart';
import '../../../../main_importants.dart';
import '../../../../core/utils/helpers/date_and_time.dart';
import '../cubit/car_details_cubit.dart';

class DateTimeBottomSheet {
  static void showDateTimeSelection({
    required BuildContext context,
    required Function(DateTime?) onDateTimeSelected,
  }) {
    final carDetailsCubit = context.read<CarDetailsCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: carDetailsCubit,
          child: DateTimeSelectionContent(
            onDateTimeSelected: onDateTimeSelected,
          ),
        );
      },
    );
  }
}

class DateTimeSelectionContent extends StatefulWidget {
  final Function(DateTime?) onDateTimeSelected;

  const DateTimeSelectionContent({super.key, required this.onDateTimeSelected});

  @override
  State<DateTimeSelectionContent> createState() => _DateTimeSelectionContentState();
}

class _DateTimeSelectionContentState extends State<DateTimeSelectionContent> {
  DateTime? _tempSelectedDate;
  TimeOfDay? _tempSelectedTime;

  @override
  Widget build(BuildContext context) {
    final carDetailsCubit = CarDetailsCubit.get(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.timeOfReceipt.tr(),
                  style: AppStyles.semiBold18Black,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: AppColors.greyColor1),
                ),
              ],
            ),
            verticalSpace(20),

            // Selected Values Display
            if (_tempSelectedDate != null || _tempSelectedTime != null)
              Column(
                children: [
                  Row(
                    children: [
                      if (_tempSelectedDate != null)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today, size: 16, color: AppColors.orange),
                                horizontalSpace(8),
                                Text(
                                  '${_tempSelectedDate!.day}/${_tempSelectedDate!.month}/${_tempSelectedDate!.year}',
                                  style: AppStyles.medium12Black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (_tempSelectedDate != null && _tempSelectedTime != null)
                        horizontalSpace(12),
                      if (_tempSelectedTime != null)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.access_time, size: 16, color: AppColors.orange),
                                horizontalSpace(8),
                                Text(
                                  _tempSelectedTime!.format(context),
                                  style: AppStyles.medium12Black,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  verticalSpace(16),
                ],
              ),

            // Date and Time Selection Row
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: _tempSelectedDate != null
                        ? '${_tempSelectedDate!.day}/${_tempSelectedDate!.month}/${_tempSelectedDate!.year}'
                        : LocaleKeys.dateOfReceipt.tr(),
                    onPressed: () async {
                      final selectedDate = await DateTimePickerHelper.selectDate(context);
                      if (selectedDate != null) {
                        setState(() {
                          _tempSelectedDate = selectedDate;
                        });
                        print("📅 Selected Date: $selectedDate");
                      }
                    },
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: CustomTextFormField(
                    hintText: _tempSelectedTime != null
                        ? _tempSelectedTime!.format(context)
                        : LocaleKeys.timeOfReceipt.tr(),
                    onPressed: () async {
                      final selectedTime = await DateTimePickerHelper.selectTime(context);
                      if (selectedTime != null) {
                        setState(() {
                          _tempSelectedTime = selectedTime;
                        });
                        print("⏰ Selected Time: $selectedTime");
                      }
                    },
                  ),
                ),
              ],
            ),
            verticalSpace(20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    btnColor: AppColors.greyColor1,
                    btnText: Text(
                      LocaleKeys.cancel.tr(),
                      style: AppStyles.semiBold16White,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: CustomButton(
                    btnText: Text(
                      LocaleKeys.confirm.tr(),
                      style: AppStyles.semiBold16White,
                    ),
                    onPressed: _tempSelectedDate != null && _tempSelectedTime != null
                        ? () {
                      final combinedDateTime = DateTime(
                        _tempSelectedDate!.year,
                        _tempSelectedDate!.month,
                        _tempSelectedDate!.day,
                        _tempSelectedTime!.hour,
                        _tempSelectedTime!.minute,
                      );


                      carDetailsCubit.updateSelectedDateTime(combinedDateTime);
                      carDetailsCubit.updateSelectedTime(_tempSelectedTime!);

                      widget.onDateTimeSelected(combinedDateTime);
                      Navigator.pop(context);
                    }
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}