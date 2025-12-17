import '../../data/models/register_model.dart';

abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}

class ToggleTypesState extends RegisterStates{}

class SelectBirthDateState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);

}
class RegisterSuccessState extends RegisterStates{
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);

}

class ChangeSuffixIconState  extends RegisterStates{}
