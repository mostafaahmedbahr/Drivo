
import 'package:easy_localization/easy_localization.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../main_importants.dart';
import '../cubit/contracts_cubit.dart';
import '../cubit/contracts_states.dart';

class ContractsToggleButtons extends StatelessWidget {
  const ContractsToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsCubit , ContractsStates>(
      buildWhen: (previous, current){
        return current is ContractsToggleButtonsState;
      },
      builder: (context,state){
        final bookingCubit = context.read<ContractsCubit>();
        return ToggleSwitch(
          minWidth: double.infinity,
          minHeight: 55.0,
          fontSize: 16.0,
          initialLabelIndex: bookingCubit.currentIndex,
          totalSwitches: 4,
          activeFgColor: AppColors.whiteColor,
          activeBgColor: [AppColors.orange],
          inactiveBgColor: AppColors.greyColor2,
          radiusStyle: true,
          labels: [LocaleKeys.all.tr(),LocaleKeys.closed.tr() , LocaleKeys.underClaim.tr() , LocaleKeys.active.tr()],
          onToggle: (index) {
            bookingCubit.toggleButtons(index!);
          },
        );
      },

    );
  }
}
