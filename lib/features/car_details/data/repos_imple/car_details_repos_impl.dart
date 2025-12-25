import 'package:dartz/dartz.dart';
import 'package:drivo/features/home/data/models/all_branches_by_city_id_model.dart';
import 'package:drivo/features/home/data/models/all_cars_model.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/car_details_repos.dart';
import '../data_source/remote_data_source.dart';
import '../models/car_details_model.dart';

class CarDetailsReposImple extends CarDetailsRepos {
  final CarDetailsRemoteDataSource carDetailsRemoteDataSource;

  CarDetailsReposImple({required this.carDetailsRemoteDataSource});


  @override
  Future<Either<Failure, CarDetailsModel>> getCarDetailsById({required int carId}) async {
    try {
      final result = await carDetailsRemoteDataSource.getCarDetailsById(carId: carId);
      return Right(result);
    } catch (e) {
      return Left(handleError(e));
    }
  }




}
