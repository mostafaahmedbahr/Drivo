import 'package:dartz/dartz.dart';
import 'package:drivo/core/utils/params/login_param.dart';
import 'package:drivo/features/login/data/models/login_model.dart';
import 'package:drivo/features/login/domain/repos/login_repos.dart';
import '../../../../core/errors/failure.dart';


class LoginWithIdNumberUseCase {
  final LoginRepos loginRepos;

  LoginWithIdNumberUseCase({required this.loginRepos});
  Future<Either<Failure, LoginModel>> call({required LoginParam loginParam}) {
    return loginRepos.login(loginParam: loginParam);
  }
}