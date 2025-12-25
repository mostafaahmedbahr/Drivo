import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/car_details_model.dart';
import '../repos/car_details_repos.dart';


class GetCarDetailsByIdUseCase {
  final CarDetailsRepos carDetailsRepos;

 GetCarDetailsByIdUseCase({required this.carDetailsRepos});
  Future<Either<Failure, CarDetailsModel>> call({required int carId}) {
    return carDetailsRepos.getCarDetailsById(carId: carId);
  }
}