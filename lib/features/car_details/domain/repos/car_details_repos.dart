import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/car_details_model.dart';


abstract class CarDetailsRepos{

  Future<Either<Failure , CarDetailsModel>> getCarDetailsById({required int carId});

}

