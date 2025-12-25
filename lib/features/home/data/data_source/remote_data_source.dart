import 'package:drivo/core/utils/app_services/remote_services/api_service.dart';
import 'package:drivo/core/utils/app_services/remote_services/end_points.dart';
import 'package:drivo/features/home/data/models/all_branches_by_city_id_model.dart';
import '../models/all_cities_model.dart';

class HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource({required this.apiService});


  Future<AllCitiesModel> getAllCities() async {
    final response = await apiService.getData(endPoint: EndPoints.cities);
    return AllCitiesModel.fromJson(response.data);
  }


  Future<AllBranchesByCityIdModel> getAllBranchesByCityId({required int cityId}) async {
    final response = await apiService.getData(endPoint: EndPoints.branchesByCityId,query: {
      "CityId" : cityId,
    });
    return AllBranchesByCityIdModel.fromJson(response.data);
  }
}