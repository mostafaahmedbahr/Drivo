import 'package:dartz/dartz.dart';
import 'package:drivo/features/home/data/models/all_cities_model.dart';
import '../../../../core/errors/failure.dart';
import '../repos/home_repos.dart';


class GetAllCitiesUseCase {
  final HomeRepos homeRepos;

  GetAllCitiesUseCase({required this.homeRepos});
  Future<Either<Failure, AllCitiesModel>> call() {
    return homeRepos.getAllCities();
  }
}