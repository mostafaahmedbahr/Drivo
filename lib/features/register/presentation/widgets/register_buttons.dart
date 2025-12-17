import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/features/register/presentation/cubit/register_states.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/utils/params/register_params.dart';
import '../../../../main_importants.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BlocConsumer<RegisterCubit , RegisterStates>(
              buildWhen: (previous, current){
                return current is RegisterLoadingState || current is RegisterSuccessState || current is RegisterErrorState;
              },
              listener: (context,state){
                if(state is RegisterSuccessState){
                  Toast.showSuccessToast(msg: LocaleKeys.accountCreatedSuccessfully.tr(), context: context);
                  context.pushNamedAndRemoveAll(Routes.loginScreen);
                }else if (state is RegisterErrorState){
                  Toast.showErrorToast(msg: LocaleKeys.somethingWentWrongPleaseTryAgain.tr(), context: context);
                }
              },
              builder: (context,state){
                var registerCubit = context.read<RegisterCubit>();
                return ConditionalBuilder(
                  condition: state is ! RegisterLoadingState,
                  fallback: (context)=> CustomLoading(),
                 builder: (context){
                    return CustomButton(
                      btnText: Text(LocaleKeys.confirm.tr(),style: AppStyles.semiBold20White),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          // print(registerCubit.nameCon.text);
                          // print(registerCubit.idsTypesList[registerCubit.idType!]);
                          // print(registerCubit.countryName);
                          // print(registerCubit.idNumberCon.text);
                          // print(registerCubit.phoneCon.text);
                          // print(registerCubit.emailCon.text);
                          // print( registerCubit.addressCon.text);
                          // print(registerCubit.countryCode);
                          // print(registerCubit.selectedHijriDate.toString());
                          // print(registerCubit.selectedDate.toString());
                          // print(registerCubit.passwordCon.text);
                          // print(registerCubit.companyCon.text.isNotEmpty ? true: false);
                          // print(registerCubit.companyCon.text);
                        registerCubit.register(registerParams:  RegisterParams(
                            name: registerCubit.nameCon.text,
                            idType: registerCubit.idsTypesList[registerCubit.idType!],
                            nationality: registerCubit.countryName,
                            idNumber: registerCubit.idNumberCon.text,
                            phoneNumber: registerCubit.phoneCon.text,
                            email: registerCubit.emailCon.text,
                            address:  registerCubit.addressCon.text,
                            prefixPhoneNumber: registerCubit.countryCode,
                            birthDateHijri:registerCubit.selectedHijriDate!=null ? registerCubit.selectedHijriDate.toString() : "",
                            birthDate: registerCubit.selectedDate!=null? registerCubit.selectedDate.toString() : "",
                            hasMobileApp: true,
                            password: registerCubit.passwordCon.text,
                            isCompanyRenter: registerCubit.companyCon.text.isNotEmpty ? true: false,
                            company: registerCubit.companyCon.text,
                        ));
                        }
                      },
                    );
                 },
                );
              },

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

// public enum IdType
// {
//   [EnumMember(Value = "هوية وطنية")]
//   NationalID = 1,
//
//   [EnumMember(Value = "هوية مقيم")]
//   ResidentID = 2,
//
//   [EnumMember(Value = "هوية زائر")]
//   Visitor = 3,
//
//   [EnumMember(Value = "هوية دول مجلس التعاون الخليجي")]
//   GCCCitizen = 4,
//
//
// }