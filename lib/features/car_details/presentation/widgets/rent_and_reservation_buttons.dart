import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';

class RentAndReservationButtons extends StatelessWidget {
  const RentAndReservationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            btnText: Text(LocaleKeys.reservation.tr(),style: AppStyles.semiBold16White,),
            onPressed: (){},
          ),
        ),
        horizontalSpace(20),
        Expanded(
          child: CustomButton(
            btnColor: AppColors.whiteColor,
            btnText: Text(LocaleKeys.rent.tr(),style: AppStyles.semiBold16Black,),
            onPressed: (){},
          ),
        ),
      ],
    );
  }
}
