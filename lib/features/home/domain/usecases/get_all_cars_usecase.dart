import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/all_cars_model.dart';
import '../repos/home_repos.dart';


class GetAllCarsUseCase {
  final HomeRepos homeRepos;

  GetAllCarsUseCase({required this.homeRepos});
  Future<Either<Failure, AllCarsModel>> call() {
    return homeRepos.getAllCars();
  }
}