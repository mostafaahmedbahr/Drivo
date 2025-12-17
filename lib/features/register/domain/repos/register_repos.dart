import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/register_params.dart';
import '../../data/models/register_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterModel>> register({
    required RegisterParams registerParams,
  });
}