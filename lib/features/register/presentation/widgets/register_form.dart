import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../../../core/utils/app_validator/app_validator.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      // نعيد البناء فقط عند تغيير النوع أو أيقونة الباسورد
      buildWhen: (previous, current) =>
      current is ToggleTypesState || current is ChangeSuffixIconState,
      builder: (context, state) {
        final registerCubit = context.read<RegisterCubit>();
        final String initialCode =
        registerCubit.typeIndex == 2 ? 'EG' : 'SA';
        final Country initialCountry =
        countries.firstWhere((c) => c.code == initialCode);
        registerCubit.countryName = initialCountry.name;
        registerCubit.countryCode = initialCountry.dialCode;
        return Column(
          children: [

            /// ==============================
            /// 1️⃣ الاسم الكامل (أول حاجة المستخدم يكتبها)
            /// ==============================
            CustomTextFormField(
              keyboardType: TextInputType.name,
              controller: registerCubit.nameCon,
              hintText: LocaleKeys.name.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  SvgImages.profile,
                  colorFilter:
                  const ColorFilter.mode(AppColors.orange, BlendMode.srcIn),
                ),
              ),
              validator: (value)=> MyValidators.displayNameValidator(value),
            ),

            verticalSpace(20),

            /// ==============================
            /// 2️⃣ رقم الهاتف (أساسي للتواصل والتحقق)
            /// ==============================
            IntlPhoneField(
              key: ValueKey(registerCubit.typeIndex),

              // تحديد الدول حسب نوع المستخدم
              countries: registerCubit.typeIndex == 0 ||
                  registerCubit.typeIndex == 1
                  ? [countries.firstWhere((c) => c.code == 'SA')]
                  : registerCubit.typeIndex == 3
                  ? countries
                  .where((c) =>
                  ['AE', 'BH', 'KW', 'OM', 'QA']
                      .contains(c.code))
                  .toList()
                  : countries,

              initialCountryCode:
              registerCubit.typeIndex == 2 ? 'EG' : 'SA',

              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: LocaleKeys.phone.tr(),
                labelStyle:
                const TextStyle(color: AppColors.greyColor1),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                filled: true,
                fillColor: AppColors.whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(SvgImages.phone),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                  const BorderSide(color: AppColors.greyColor1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                  const BorderSide(color: AppColors.greyColor1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                  const BorderSide(color: AppColors.greyColor1),
                ),
              ),

              keyboardType: TextInputType.number,

              // حفظ الدولة المختارة
              onCountryChanged: (Country country) {
                registerCubit.countryName = country.name;
              },

              // حفظ رقم الهاتف كامل
              onChanged: (PhoneNumber phone) {
                registerCubit.phoneNumber = phone.completeNumber;
                registerCubit.countryCode = phone.countryCode;
                registerCubit.phoneCon.text = phone.number;
                print(registerCubit.countryCode);
              },

              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.number.isEmpty) {
                  return LocaleKeys.phoneValidate.tr();
                }
                return null;
              },
            ),

            verticalSpace(10),

            /// ==============================
            /// 3️⃣ البريد الإلكتروني (وسيلة تواصل بديلة)
            /// ==============================
            CustomTextFormField(
              controller: registerCubit.emailCon,
              keyboardType: TextInputType.emailAddress,
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgImages.email),
              ),
              validator: (value)=> MyValidators.emailValidator(value),
            ),

            verticalSpace(20),

            /// ==============================
            /// 4️⃣ رقم الهوية (بعد التأكد من التواصل)
            /// ==============================
            CustomTextFormField(
              controller: registerCubit.idNumberCon,
              keyboardType: TextInputType.number,
              hintText: LocaleKeys.idNumber.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(SvgImages.id),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.idNumberValidate.tr();
                }
                if (value.length < 8) {
                  return LocaleKeys.idNumberLength.tr();
                }
                return null;
              },
            ),

            verticalSpace(20),

            /// ==============================
            /// 5️⃣ العنوان (لتحديد الموقع)
            /// ==============================
            CustomTextFormField(
              controller: registerCubit.addressCon,
              keyboardType: TextInputType.text,
              hintText: LocaleKeys.location.tr(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(SvgImages.location),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return LocaleKeys.addressValidate.tr();
                }
                return null;
              },

            ),


            verticalSpace(20),

            /// ==============================
            /// 7️⃣ اسم الشركة (اختياري / مهني – آخر حاجة)
            /// ==============================
            CustomTextFormField(
              controller: registerCubit.companyCon,
              keyboardType: TextInputType.text,
              hintText: "${LocaleKeys.companyName.tr()} (${LocaleKeys.optional.tr()})",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  SvgImages.home,
                  colorFilter:
                  const ColorFilter.mode(AppColors.orange, BlendMode.srcIn),
                ),
              ),
            ),

            verticalSpace(20),

            /// ==============================
            /// 6️⃣ كلمة المرور (بيانات الحساب)
            /// ==============================
            CustomTextFormField(
              controller: registerCubit.passwordCon,
              keyboardType: TextInputType.visiblePassword,
              hintText: LocaleKeys.password.tr(),
              obscureText: registerCubit.isVisible,
              validator: MyValidators.passwordValidator,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  SvgImages.password,
                  colorFilter:
                  const ColorFilter.mode(AppColors.orange, BlendMode.srcIn),
                ),
              ),
              suffixIcon: IconButton(
                color: AppColors.greyColor1,
                icon: Icon(
                  registerCubit.isVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: registerCubit.changeSuffixIcon,
              ),
            ),
          ],
        );
      },
    );
  }
}

