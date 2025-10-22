import 'package:drivo/features/register/presentation/cubit/register_cubit.dart';
import 'package:drivo/main_importants.dart';

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
          child: Column(
            children: [
              RegisterUserTypes(),
              verticalSpace(20),
              RegisterForm(),
              Spacer(),
              RegisterButtons(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
