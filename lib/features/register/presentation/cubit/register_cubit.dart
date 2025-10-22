import 'package:drivo/features/register/presentation/cubit/register_states.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main_importants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  int typeIndex = 0;
  toggleTypes(int index)
  {
    typeIndex = index;
    emit(ToggleTypesState());
  }

  List<String> typesName = [
    LocaleKeys.saudi.tr(),
    LocaleKeys.resident.tr(),
    LocaleKeys.cooperationCouncil.tr(),
    LocaleKeys.visitor.tr(),
  ];

}