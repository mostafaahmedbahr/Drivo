import 'package:drivo/features/home/data/models/all_cities_model.dart';
import 'package:drivo/features/home/domain/usecases/get_all_branches_by_city_id_usecase.dart';
import 'package:drivo/features/home/domain/usecases/get_all_cities_usecase.dart';

import '../../../../main_importants.dart';
import '../../data/models/all_branches_by_city_id_model.dart'  ;
import '../../data/models/all_cars_model.dart';
import '../../domain/usecases/get_all_cars_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.getAllCarsUseCase ,required this.getAllCitiesUseCase , required this.getAllBranchesByCityIdUseCase}) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final GetAllCitiesUseCase getAllCitiesUseCase;
  final GetAllCarsUseCase getAllCarsUseCase;
  final GetAllBranchesByCityIdUseCase getAllBranchesByCityIdUseCase;



  Cities? selectedCity;
  Branches? selectedBranch;
  void selectCity(Cities? city) {
    selectedCity = city;
    selectedBranch = null;

    emit(HomeCitySelectedState());

    if (city?.cityId != null) {
      getAllBranchesByCityId(cityId: city!.cityId!);
    }

    print("Selected City From: ${city?.cityNameAr}");
  }


  void selectBranch(Branches? branch) {
    selectedBranch = branch;
    emit(HomeBranchSelectedState());
    print("Selected Branches From: ${branch?.branchName}");
  }






  String? selectedCityTo;
  String? selectedBranchTo;


  final List<String> branches = [
    'Downtown Branch',
    'Nasr City Branch',
    'Heliopolis Branch',
    'Maadi Branch',
    '6th October Branch',
    'New Cairo Branch',
  ];


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



  AllCitiesModel? allCitiesModel;
  Future<void> getAllCities() async {
    emit(GetAllCitiesLoadingState());
    final result = await getAllCitiesUseCase.call();
    result.fold(
          (failure) => emit(GetAllCitiesErrorState(failure.errMessage.toString())),
          (cities){
            allCitiesModel = cities;
            emit(GetAllCitiesSuccessState(cities));
          },
    );
  }


  AllBranchesByCityIdModel? allBranchesByCityIdModel;
  Future<void> getAllBranchesByCityId({required int cityId}) async {
    emit(GetAllBranchesByCityIdLoadingState());
    final result = await getAllBranchesByCityIdUseCase.call(cityId: cityId);
    result.fold(
          (failure) => emit(GetAllBranchesByCityIdErrorState(failure.errMessage.toString())),
          (branches){
            allBranchesByCityIdModel = branches;
        emit(GetAllBranchesByCityIdSuccessState(branches));
      },
    );
  }



  AllCarsModel? allCarsModel;
  Future<void> getAllCars() async {
    emit(GetAllCarsLoadingState());
    final result = await getAllCarsUseCase.call();
    result.fold(
          (failure) => emit(GetAllCarsErrorState(failure.errMessage.toString())),
          (cities){
        allCarsModel = cities;
        emit(GetAllCarsSuccessState(cities));
      },
    );
  }

}