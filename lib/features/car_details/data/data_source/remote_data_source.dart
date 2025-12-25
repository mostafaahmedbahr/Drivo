import 'package:drivo/core/utils/app_services/remote_services/api_service.dart';
import 'package:drivo/core/utils/app_services/remote_services/end_points.dart';
import 'package:drivo/features/car_details/data/models/car_details_model.dart';

class CarDetailsRemoteDataSource {
  final ApiService apiService;

  CarDetailsRemoteDataSource({required this.apiService});



  Future<CarDetailsModel> getCarDetailsById({required int carId}) async {
    final response = await apiService.getData(endPoint: "${EndPoints.carDetails}/$carId",);
    return CarDetailsModel.fromJson(response.data);
  }



}