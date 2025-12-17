import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/params/register_params.dart';
import '../datasource/register_remote_data_source.dart';
import '../models/register_model.dart';
import '../../domain/repos/register_repos.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, RegisterModel>> register({
    required RegisterParams registerParams,
  }) async {
    try {
      final remoteRegister = await remoteDataSource.register(registerParams);
      return Right(remoteRegister);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}