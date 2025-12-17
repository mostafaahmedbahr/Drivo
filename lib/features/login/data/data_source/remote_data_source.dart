

import 'package:drivo/core/utils/app_services/remote_services/api_service.dart';
import 'package:drivo/core/utils/app_services/remote_services/end_points.dart';
import 'package:drivo/core/utils/params/login_params.dart';

import '../models/login_model.dart';

class LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSource({required this.apiService});
  Future<LoginModel> login({required LoginWithPasswordParams loginWithPasswordParams}) async {
    final response = await apiService.postData(endPoint: EndPoints.login,data: loginWithPasswordParams.toJson(),);
    return LoginModel.fromJson(response.data);
  }
}