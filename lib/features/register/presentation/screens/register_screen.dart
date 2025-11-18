import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/main_importants.dart';

import '../widgets/birth_date_section.dart';
import '../widgets/register_buttons.dart';
import '../widgets/register_form.dart';
import '../widgets/register_user_types.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              RegisterUserTypes(),
              verticalSpace(20),
              RegisterForm(),
              verticalSpace(20),
              BirthDateSection(),
              verticalSpace(60),
              RegisterButtons(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
