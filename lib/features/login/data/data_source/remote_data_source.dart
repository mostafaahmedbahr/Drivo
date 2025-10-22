

import 'package:drivo/core/utils/app_services/remote_services/api_service.dart';
import 'package:drivo/core/utils/app_services/remote_services/end_points.dart';
import 'package:drivo/core/utils/params/login_param.dart';

import '../models/login_model.dart';

class LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSource({required this.apiService});
  Future<LoginModel> login({required LoginParam loginParam}) async {
    final response = await apiService.postData(endPoint: EndPoints.login,data: loginParam,);
    return LoginModel.fromJson(response.data);
  }
}