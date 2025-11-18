import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/features/register/presentation/cubit/register_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jhijri/_src/_jHijri.dart';
import '../../../../core/utils/helpers/date_and_time.dart';
 import '../../../../main_importants.dart';

class BirthDateSection extends StatelessWidget {
  const BirthDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen: (_, current) => current is SelectBirthDateState,
      builder: (context, state) {
        var cubit = context.read<RegisterCubit>();

        return CustomTextFormField(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(SvgImages.calendar,colorFilter: ColorFilter.mode(AppColors.orange, BlendMode.srcIn)),
          ),
          hintColor: AppColors.greyColor1,
          hintText:
          cubit.typeIndex==0?
          cubit.selectedHijriDate != null
        ? '${cubit.selectedHijriDate}'
            : LocaleKeys.selectBirthDate.tr() :
         cubit.selectedDate != null
        ? '${cubit.selectedDate!.day}/${cubit.selectedDate!.month}/${cubit.selectedDate!.year}'
            : LocaleKeys.dateOfReceipt.tr(),

          onPressed: () async {
            if (cubit.typeIndex == 0) {
              /// هجري
              JHijri? date = await DateTimePickerHelper.pickHijri(context);
              if (date != null) cubit.selectHijriDate(date);

            } else {
              /// ميلادي
              DateTime? date = await DateTimePickerHelper.selectDate(context);
              if (date != null) cubit.selectDate(date);
            }
          },
        );
      },
    );
  }
}
