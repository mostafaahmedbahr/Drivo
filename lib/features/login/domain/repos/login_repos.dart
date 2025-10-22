import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/login_param.dart';
import '../../data/models/login_model.dart';

abstract class LoginRepos{

  Future<Either<Failure , LoginModel>> login({required LoginParam loginParam});

}

