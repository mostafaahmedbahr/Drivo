import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
                btnText: Text(LocaleKeys.confirm.tr(),style: AppStyles.semiBold20White),
                onPressed: (){},
            ),
        ),
        horizontalSpace(20),
        Expanded(
          child: CustomButton(
              btnText: Text(LocaleKeys.skip.tr(),style: AppStyles.semiBold20Black,),
            btnColor: AppColors.whiteColor,
            onPressed: (){}),
        ),
      ],
    );
  }
}
