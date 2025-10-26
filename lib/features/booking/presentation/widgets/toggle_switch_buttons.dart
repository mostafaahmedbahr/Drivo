import 'package:drivo/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:drivo/features/booking/presentation/cubit/booking_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../main_importants.dart';

class ToggleSwitchButtons extends StatelessWidget {
  const ToggleSwitchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit , BookingStates>(
      buildWhen: (previous, current){
        return current is ToggleSwitchButtonsState;
      },
      builder: (context,state){
        final bookingCubit = context.read<BookingCubit>();
        return ToggleSwitch(
          minWidth: double.infinity,
          minHeight: 55.0,
          fontSize: 16.0,
          initialLabelIndex: bookingCubit.currentIndex,
          totalSwitches: 3,
          activeFgColor: AppColors.whiteColor,
          activeBgColor: [AppColors.orange],
          inactiveBgColor: AppColors.greyColor2,
          radiusStyle: true,
          labels: [LocaleKeys.all.tr() , LocaleKeys.current.tr() , LocaleKeys.completed.tr()],
          onToggle: (index) {
            bookingCubit.toggleSwitchButtons(index!);
          },
        );
      },

    );
  }
}
