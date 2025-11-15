import 'package:drivo/core/shared_widgets/custom_drop_down.dart';
import 'package:drivo/features/home/presentation/cubit/home_cubit.dart';
import 'package:drivo/features/home/presentation/cubit/home_states.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class ChooseYourCar extends StatelessWidget {
  const ChooseYourCar({super.key});
 
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA =   GlobalKey();

    return BlocBuilder<HomeCubit , HomeStates>(
      buildWhen: (previous, current){
        return current is HomeBranchSelectedState || current is HomeCitySelectedState || current is ChangeCheckboxValueState
            || current is HomeCityToSelectedState || current is HomeBranchToSelectedState ;
      },
      builder: (context,state){
        var homeCubit = context.read<HomeCubit>();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ExpansionTileCard(
                baseColor: AppColors.whiteColor,
                expandedColor: AppColors.whiteColor,
                key: cardA,
                title:  Text(LocaleKeys.chooseYourCarNow.tr(), style: AppStyles.semiBold18Black),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  verticalSpace(12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LocaleKeys.choosePickupLocation.tr(), style: AppStyles.semiBold18Black),
                        verticalSpace(8),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                value: homeCubit.selectedCity,
                                items: homeCubit.cities,
                                onChanged: (val) {
                                  homeCubit.selectCity(val);
                                },
                                hint: LocaleKeys.city.tr(),
                                itemDisplayBuilder: (item) => item,

                              ),
                            ),
                            horizontalSpace(12),
                            Expanded(
                              child: CustomDropdown(
                                value: homeCubit.selectedBranch,
                                items: homeCubit.branches,
                                onChanged: (val) {
                                  homeCubit.selectBranch(val);
                                },
                                hint: LocaleKeys.branch.tr(),
                                itemDisplayBuilder: (item) => item,

                              ),
                            ),
                          ],
                        ),
                        verticalSpace(12),

                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: homeCubit.isChecked,
                        activeColor: AppColors.orange,
                        checkColor: AppColors.whiteColor,
                        fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.orange;
                          }
                          return Colors.transparent;
                        }),
                        side: const BorderSide(
                          color: AppColors.greyColor1,
                          width: 2.0,
                        ),
                        onChanged: (bool? value) {
                          homeCubit.changeCheckboxValue(value!);
                        },
                      ),
                      Text(LocaleKeys.deliveryToAnotherLocation.tr(), style: AppStyles.semiBold18Black),
                    ],
                  ),
                  if(homeCubit.isChecked)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                value: homeCubit.selectedCityTo,
                                items: homeCubit.cities,
                                onChanged: (val) {
                                  homeCubit.selectCityTo(val);
                                },
                                hint: LocaleKeys.city.tr(),
                                itemDisplayBuilder: (item) => item,

                              ),
                            ),
                            horizontalSpace(12),
                            Expanded(
                              child: CustomDropdown(
                                value: homeCubit.selectedBranchTo,
                                items: homeCubit.branches,
                                onChanged: (val) {
                                  homeCubit.selectBranchTo(val);
                                },
                                hint: LocaleKeys.branch.tr(),
                                itemDisplayBuilder: (item) => item,

                              ),
                            ),
                          ],
                        ),
                        verticalSpace(12),

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
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: CustomTextFormField(
            //           hintText: LocaleKeys.dateOfReceipt.tr(),
            //           onPressed: () async {
            //             // 1️⃣ المستخدم يختار التاريخ
            //             final selectedDate = await DateTimePickerHelper.selectDate(context);
            //             if (selectedDate != null) {
            //               print("📅 التاريخ المختار: $selectedDate");
            //
            //               // 2️⃣ بعد اختيار التاريخ مباشرة، نفتح اختيار الوقت
            //               final selectedTime = await DateTimePickerHelper.selectTime(context);
            //               if (selectedTime != null) {
            //                 print("⏰ الوقت المختار: ${selectedTime.format(context)}");
            //
            //                 // 3️⃣ لو عايز تجمع التاريخ والوقت معًا في DateTime
            //                 final combinedDateTime = DateTime(
            //                   selectedDate.year,
            //                   selectedDate.month,
            //                   selectedDate.day,
            //                   selectedTime.hour,
            //                   selectedTime.minute,
            //                 );
            //
            //                 print("📆 التاريخ والوقت الكامل: $combinedDateTime");
            //
            //                 // هنا تقدر تحفظ القيمة أو تحدث state
            //                 // setState(() { _selectedDateTime = combinedDateTime; });
            //               }
            //             }
            //           },
            //         ),
            //       ),
            //       horizontalSpace(12),
            //       Expanded(child: CustomTextFormField(
            //         onPressed: () async {
            //           final selectedTime = await DateTimePickerHelper.selectTime(context);
            //           if (selectedTime != null) {
            //             print("📅 الوقت المختار: $selectedTime");
            //             // تقدر تحدث الـ state هنا أو تحفظ القيمة
            //           }
            //         },
            //         hintText: LocaleKeys.timeOfReceipt.tr(),
            //       )),
            //     ],
            //   ),
            // ),

          ],
        );
      } ,
       
    );
  }
}