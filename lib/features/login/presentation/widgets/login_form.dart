import 'package:drivo/core/shared_widgets/custom_text_form_filed.dart';
import 'package:drivo/core/utils/app_images/svg_images.dart';
import 'package:drivo/features/login/presentation/widgets/main_title_for_text_from.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
 import 'package:pin_code_fields/pin_code_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.loginMember.tr(),style: AppStyles.regular14BleachedCedar,),
        verticalSpace(14),
        Row(
          children: [
            MainTitleForTextFrom(title: LocaleKeys.idNumber.tr(), image: SvgImages.idNumber),
            horizontalSpace(14),
            Expanded(child: CustomTextFormField(
            )),
          ],
        ),
        verticalSpace(14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTitleForTextFrom(title: LocaleKeys.passcode.tr(), image: SvgImages.password),
            horizontalSpace(14),
            Expanded(child:PinCodeTextField(
              keyboardType : TextInputType.number,
            //  controller: controller,
              length: 4,
              appContext: context,
              onChanged: (_) {},
              onCompleted: (_) => FocusScope.of(context).unfocus(),
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                selectedColor: AppColors.shipGray,
                selectedFillColor: AppColors.shipGray,
                inactiveColor: AppColors.greyColor1,
                inactiveFillColor: AppColors.whiteColor,
                activeColor: AppColors.greyColor1,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 54,
                fieldWidth: 54,
                borderWidth: 1,
                activeBorderWidth: 1,
                selectedBorderWidth: 1,
                disabledBorderWidth:1,
                inactiveBorderWidth: 1,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.white,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              beforeTextPaste: (text) => true,
            )),
          ],
        ),
      ],
    );
  }
}
