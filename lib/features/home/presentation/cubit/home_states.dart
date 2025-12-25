import 'package:drivo/features/home/data/models/all_branches_by_city_id_model.dart';
import 'package:drivo/features/home/data/models/all_cities_model.dart';

abstract class HomeStates{}

class HomeInitState extends HomeStates{}

class HomeCitySelectedState extends HomeStates{}
class HomeBranchSelectedState extends HomeStates{}
class HomeCityToSelectedState extends HomeStates{}
class HomeBranchToSelectedState extends HomeStates{}

class ChangeCheckboxValueState extends HomeStates{}

class GetAllCitiesLoadingState extends HomeStates{}
class GetAllCitiesErrorState extends HomeStates{
  final String error;
  GetAllCitiesErrorState(this.error);

}
class GetAllCitiesSuccessState extends HomeStates{
  final AllCitiesModel allCitiesModel;
  GetAllCitiesSuccessState(this.allCitiesModel);

}


class GetAllBranchesByCityIdLoadingState extends HomeStates{}
class GetAllBranchesByCityIdErrorState extends HomeStates{
  final String error;
  GetAllBranchesByCityIdErrorState(this.error);

}
class GetAllBranchesByCityIdSuccessState extends HomeStates{
  final AllBranchesByCityIdModel allBranchesByCityIdModel;
  GetAllBranchesByCityIdSuccessState(this.allBranchesByCityIdModel);

}