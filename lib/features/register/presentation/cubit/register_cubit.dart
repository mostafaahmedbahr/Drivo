import 'package:drivo/core/utils/params/register_params.dart';
import 'package:drivo/features/register/domain/usecases/register_usecase.dart';
import 'package:drivo/features/register/presentation/cubit/register_states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jhijri/_src/_jHijri.dart';
import '../../../../main_importants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUsecase}) : super(RegisterInitState());

  final RegisterUsecase registerUsecase;

  static RegisterCubit get(context) => BlocProvider.of(context);

  int typeIndex = 0;
  int? idType;
  toggleTypes(int index)
  {
    typeIndex = index;
    if(typeIndex==0){
      selectedDate=null;
    }else{
      selectedHijriDate=null;
    }
    idType = typeIndex;
    emit(ToggleTypesState());
  }

  List<String> idsTypesList = [
    "NationalID",
    "ResidentID",
    "Visitor",
    "GCCCitizen",
  ];

  List<String> typesName = [
    LocaleKeys.saudi.tr(),
    LocaleKeys.resident.tr(),
    LocaleKeys.visitor.tr(),
    LocaleKeys.cooperationCouncil.tr(),

  ];

  DateTime? selectedDate;
  JHijri? selectedHijriDate;
  void selectDate(DateTime date) {
    selectedDate = date;
    emit(SelectBirthDateState());
  }
  void selectHijriDate(JHijri date) {
    selectedHijriDate = date;
    emit(SelectBirthDateState());
  }

  Future<void> register({required RegisterParams registerParams}) async {
    emit(RegisterLoadingState());
    final result = await registerUsecase.call(registerParams: registerParams);
    result.fold(
          (failure) => emit(RegisterErrorState(failure.errMessage.toString())),
          (register) => emit(RegisterSuccessState(register)),
    );
  }


  var nameCon = TextEditingController();
  var idNumberCon = TextEditingController();
  var phoneCon = TextEditingController();
  var emailCon = TextEditingController();
  var addressCon = TextEditingController();
  var passwordCon = TextEditingController();
  var companyCon = TextEditingController();
  String phoneNumber = '';
  String countryCode = '';
  String countryName = '';
  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }


}