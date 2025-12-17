import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repos/register_repos.dart';
import '../../../../core/utils/params/register_params.dart';
import '../../data/models/register_model.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});

  Future<Either<Failure, RegisterModel>> call({
    required RegisterParams registerParams,
  }) {
    return repository.register(registerParams: registerParams);
  }
}