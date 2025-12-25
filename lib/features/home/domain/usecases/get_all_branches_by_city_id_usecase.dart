import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/all_branches_by_city_id_model.dart';
import '../repos/home_repos.dart';


class GetAllBranchesByCityIdUseCase {
  final HomeRepos homeRepos;

 GetAllBranchesByCityIdUseCase({required this.homeRepos});
  Future<Either<Failure, AllBranchesByCityIdModel>> call({required int cityId}) {
    return homeRepos.getAllBranchesByCityId(cityId: cityId);
  }
}