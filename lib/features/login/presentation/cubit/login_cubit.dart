import '../../../../core/utils/params/login_params.dart';
import '../../../../main_importants.dart';
import '../../domain/usecases/login_with_passwordn_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginWithPasswordUseCase}) : super(LoginInitState());

  final LoginWithPasswordUseCase loginWithPasswordUseCase;

  static LoginCubit get(context) => BlocProvider.of(context);




  Future<void> login({required LoginWithPasswordParams loginWithPasswordParams}) async {
    emit(LoginLoadingState());
    final result = await loginWithPasswordUseCase.call(loginWithPasswordParams: loginWithPasswordParams);
    result.fold(
          (failure) => emit(LoginErrorState(failure.errMessage.toString())),
          (register) => emit(LoginSuccessState(register)),
    );
  }


  var idNumber = TextEditingController();
  var passwordCon = TextEditingController();
  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }





}