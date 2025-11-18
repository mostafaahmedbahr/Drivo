import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      buildWhen: (previous, current) => current is ToggleTypesState,
      builder: (context, state) {
        var registerCubit = context.read<RegisterCubit>();
        return Column(
          children: [
            IntlPhoneField(
              key: ValueKey(registerCubit.typeIndex),
              countries: registerCubit.typeIndex == 0 || registerCubit.typeIndex == 1
                  ? [countries.firstWhere((c) => c.code == 'SA')]
                  : registerCubit.typeIndex == 2
                  ? countries.where((c) => ['AE','BH','KW','OM','QA'].contains(c.code)).toList()
                  : countries,
              initialCountryCode: registerCubit.typeIndex == 3? 'EG': 'SA',
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: LocaleKeys.phone.tr(),
                labelStyle: const TextStyle(color: AppColors.greyColor1),
                contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                filled: true,
                fillColor: AppColors.whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(SvgImages.phone),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColors.greyColor1),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColors.greyColor1),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: AppColors.greyColor1),
                ),
              ),
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                child: SvgPicture.asset(SvgImages.id),
              ),
            ),
            verticalSpace(20),
            CustomTextFormField(
              keyboardType: TextInputType.text,
              hintText: LocaleKeys.country.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgImages.country),
              ),
            ),
            verticalSpace(20),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgImages.email),
              ),
            ),
            verticalSpace(20),
            CustomTextFormField(
              keyboardType: TextInputType.text,
              hintText: LocaleKeys.location.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgImages.location),
              ),
            ),
          ],
        );
      },
    );
  }
}
