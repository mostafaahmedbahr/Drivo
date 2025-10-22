import 'package:dartz/dartz.dart';
import 'package:drivo/core/utils/params/login_param.dart';
import 'package:drivo/features/login/data/data_source/remote_data_source.dart';
import 'package:drivo/features/login/data/models/login_model.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/login_repos.dart';

class LoginReposImple extends LoginRepos {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginReposImple({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> login({required LoginParam loginParam}) async {
    try {
      final result = await loginRemoteDataSource.login(loginParam: loginParam);
      return Right(result);
    } catch (e) {
      return Left(handleError(e));
    }
  }
}
