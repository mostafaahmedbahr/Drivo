import 'package:drivo/core/app_nav/nav_extensions.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/app_nav/router/routes.dart';
import '../../../layout/presentation/screens/layout_screen.dart';
import '../../../register/presentation/screens/register_screen.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(btnText: Text(LocaleKeys.login.tr(),style: AppStyles.semiBold14White,), onPressed: (){
          context.pushNamed(Routes.layoutScreen);
        }),
        verticalSpace(24),
        Row(
          children: [
            Expanded(child: CustomButton(
                btnColor: AppColors.orange,
                borderColor: AppColors.orange,
                btnText: Text(LocaleKeys.membershipRegister.tr(),
              style: AppStyles.semiBold14White,), onPressed: (){
              context.pushNamed(Routes.registerScreen);
            })),
            horizontalSpace(20),
            Expanded(child: CustomButton(
                btnColor: AppColors.whiteColor,
                borderColor: AppColors.orange,
                btnText: Text(LocaleKeys.continueAsGuest.tr(),style: AppStyles.semiBold14Orange,), onPressed: (){})),
          ],
        )
      ],
    );
  }
}
