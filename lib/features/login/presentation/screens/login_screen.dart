import 'package:drivo/features/login/presentation/widgets/logo_widget.dart';
import 'package:drivo/main_importants.dart';

import '../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../cubit/login_cubit.dart';
import '../widgets/forget_password_text_button.dart';
import '../widgets/login_buttons.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context)=>getIt<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
          child: Form(
            key: loginFormKey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                verticalSpace(30),
              LogoWidget(),
                verticalSpace(20),
                LoginForm(),
                ForgetPasswordTextButton(),
                verticalSpace(40),
                LoginButtons(formKey: loginFormKey,),
            ],),
          ),
        )),
      ),
    );
  }
}

