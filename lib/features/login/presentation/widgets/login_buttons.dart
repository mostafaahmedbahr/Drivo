import 'package:drivo/core/utils/params/login_params.dart';
import 'package:drivo/features/login/presentation/cubit/login_cubit.dart';
import 'package:drivo/features/login/presentation/cubit/login_states.dart';
import 'package:drivo/main_importants.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<LoginCubit, LoginStates>(
          buildWhen: (previous, current) {
            return current is LoginSuccessState ||
                current is LoginErrorState ||
                current is LoginLoadingState;
          },
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Toast.showSuccessToast(
                msg: LocaleKeys.loginSuccessfully.tr(),
                context: context,
              );
              context.pushNamedAndRemoveAll(Routes.layoutScreen);
            } else if (state is LoginErrorState) {
              Toast.showErrorToast(
                msg: state.error.toString(),
                context: context,
              );
            }
          },
          builder: (context, state) {
            var loginCubit = context.read<LoginCubit>();
            return ConditionalBuilder(
              condition: state is ! LoginLoadingState,
              fallback: (context)=>CustomLoading(),
              builder: (context){
                return CustomButton(
                  btnText: Text(
                    LocaleKeys.login.tr(),
                    style: AppStyles.semiBold14White,
                  ),
                  onPressed: () {
                    if(formKey.currentState!.validate()){

                      loginCubit.login(
                        loginWithPasswordParams: LoginWithPasswordParams(
                          password: loginCubit.passwordCon.text,
                          number: loginCubit.idNumber.text,
                        ),
                      );
                    }
                  },
                );
              },

            );
          },
        ),
        verticalSpace(24),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                btnColor: AppColors.orange,
                borderColor: AppColors.orange,
                btnText: Text(
                  LocaleKeys.membershipRegister.tr(),
                  style: AppStyles.semiBold14White,
                ),
                onPressed: () {
                  context.pushNamed(Routes.registerScreen);
                },
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: CustomButton(
                btnColor: AppColors.whiteColor,
                borderColor: AppColors.orange,
                btnText: Text(
                  LocaleKeys.continueAsGuest.tr(),
                  style: AppStyles.semiBold14Orange,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
