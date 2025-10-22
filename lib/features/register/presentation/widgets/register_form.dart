import 'package:drivo/core/shared_widgets/custom_text_form_filed.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../core/utils/app_images/svg_images.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntlPhoneField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: LocaleKeys.phone.tr(),
            labelStyle: const TextStyle(color: AppColors.greyColor1),
            contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            filled: true,
            fillColor: AppColors.whiteColor,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(SvgImages.phone,),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.greyColor1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.greyColor1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.greyColor1),
            ),
          ),
          initialCountryCode: 'EG',
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (PhoneNumber phone) {
            //loginCubit.phoneNumber = phone.completeNumber;
          },
          validator: (value) {
            if (value == null || value.number.isEmpty) {
              return LocaleKeys.phoneValidate.tr();
            }
            return null;
          },
        ),
        CustomTextFormField(
          keyboardType: TextInputType.number,
          hintText: LocaleKeys.idNumber.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(SvgImages.id,),
          ),
        ),
        verticalSpace(20),
        CustomTextFormField(
          keyboardType: TextInputType.text,
          hintText: LocaleKeys.country.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(SvgImages.country,),
          ),
        ),

        verticalSpace(20),
        CustomTextFormField(
          keyboardType: TextInputType.emailAddress,
          hintText: LocaleKeys.email.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(SvgImages.email,),
          ),
        ),

        verticalSpace(20),
        CustomTextFormField(
          keyboardType: TextInputType.text,
          hintText: LocaleKeys.location.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(SvgImages.location,),
          ),
        ),
      ],
    );
  }
}
