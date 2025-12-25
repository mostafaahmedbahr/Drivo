import 'package:dartz/dartz.dart';
import 'package:drivo/features/home/data/models/all_cities_model.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/all_branches_by_city_id_model.dart';

abstract class HomeRepos{

  Future<Either<Failure , AllCitiesModel>> getAllCities();
  Future<Either<Failure , AllBranchesByCityIdModel>> getAllBranchesByCityId({required int cityId});

}

