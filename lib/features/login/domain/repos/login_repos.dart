import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/login_params.dart';
import '../../data/models/login_model.dart';

abstract class LoginRepos{

  Future<Either<Failure , LoginModel>> login({required LoginWithPasswordParams loginWithPasswordParams});

}

