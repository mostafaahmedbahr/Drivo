import '../../../../main_importants.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);


  String? selectedCity;
  String? selectedBranch;
  String? selectedCityTo;
  String? selectedBranchTo;

  final List<String> cities = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Beni Suef',
    'Luxor',
    'Aswan',
    'Port Said',
    'Suez',
  ];

  final List<String> branches = [
    'Downtown Branch',
    'Nasr City Branch',
    'Heliopolis Branch',
    'Maadi Branch',
    '6th October Branch',
    'New Cairo Branch',
  ];

  void selectCity(String? city) {
    selectedCity = city;
    selectedBranch = null;
    emit(HomeCitySelectedState());
    print('Selected City: $selectedCity');
  }
  void selectBranch(String? branch) {
    selectedBranch = branch;
    emit(HomeBranchSelectedState());
    print('Selected Branch: $selectedBranch');
  }

  void selectCityTo(String? cityTo) {
    selectedCityTo = cityTo;
    selectedBranchTo = null;
    emit(HomeCityToSelectedState());
    print('Selected City: $selectedCityTo');
  }
  void selectBranchTo(String? branchTo) {
    selectedBranchTo = branchTo;
    emit(HomeBranchToSelectedState());
    print('Selected Branch: $selectedBranchTo');
  }


  bool isChecked = false;
  void changeCheckboxValue(bool value)
  {
    isChecked = value;
    emit(ChangeCheckboxValueState());
  }
}