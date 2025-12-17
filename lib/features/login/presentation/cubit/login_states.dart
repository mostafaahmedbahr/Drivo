
import '../../data/models/login_model.dart';

abstract class LoginStates{}

class LoginInitState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);

}
class LoginSuccessState extends LoginStates{
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);

}

class ChangeSuffixIconState  extends LoginStates{}