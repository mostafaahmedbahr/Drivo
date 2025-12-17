import '../../../../main_importants.dart';
import 'contracts_states.dart';


class ContractsCubit extends Cubit<ContractsStates> {
  ContractsCubit() : super(ContractsInitState());

  static ContractsCubit get(context) => BlocProvider.of(context);


  int currentIndex = 1;
  toggleButtons(int index){
    currentIndex = index;
    emit(ContractsToggleButtonsState());
  }



}