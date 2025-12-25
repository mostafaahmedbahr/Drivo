import 'package:dartz/dartz.dart';
import 'package:drivo/features/home/data/models/all_branches_by_city_id_model.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/home_repos.dart';
import '../data_source/remote_data_source.dart';
import '../models/all_cities_model.dart';

class HomeReposImple extends HomeRepos {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImple({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, AllCitiesModel>> getAllCities() async {
    try {
      final result = await homeRemoteDataSource.getAllCities();
      return Right(result);
    } catch (e) {
      return Left(handleError(e));
    }
  }


  @override
  Future<Either<Failure, AllBranchesByCityIdModel>> getAllBranchesByCityId({required int cityId}) async {
    try {
      final result = await homeRemoteDataSource.getAllBranchesByCityId(cityId: cityId);
      return Right(result);
    } catch (e) {
      return Left(handleError(e));
    }
  }
}
