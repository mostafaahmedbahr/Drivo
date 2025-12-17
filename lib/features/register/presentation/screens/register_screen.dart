import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/main_importants.dart';

import '../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../widgets/birth_date_section.dart';
import '../widgets/register_buttons.dart';
import '../widgets/register_form.dart';
import '../widgets/register_user_types.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final registerFormKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context)=>getIt<RegisterCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: registerFormKey,
            child: ListView(
              children: [
                RegisterUserTypes(),
                verticalSpace(20),
                RegisterForm(),
                verticalSpace(20),
                BirthDateSection(),
                verticalSpace(60),
                RegisterButtons(formKey: registerFormKey,),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
