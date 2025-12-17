import 'package:drivo/core/utils/app_services/remote_services/end_points.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/params/register_params.dart';
import '../models/register_model.dart';

class RegisterRemoteDataSource {
  final ApiService apiService;

  RegisterRemoteDataSource({required this.apiService});


  Future<RegisterModel> register(RegisterParams registerParams) async {
    final response = await apiService.postData(endPoint: EndPoints.register,data: registerParams.toJson());
    return RegisterModel.fromJson(response.data);
  }
}