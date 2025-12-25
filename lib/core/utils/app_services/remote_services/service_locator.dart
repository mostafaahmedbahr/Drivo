import 'package:dio/dio.dart';
import 'package:drivo/features/home/domain/usecases/get_all_branches_by_city_id_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/home/data/data_source/remote_data_source.dart';
import '../../../../features/home/data/repos_imple/home_repos_impl.dart';
import '../../../../features/home/domain/repos/home_repos.dart';
import '../../../../features/home/domain/usecases/get_all_cities_usecase.dart';
import '../../../../features/home/presentation/cubit/home_cubit.dart';
import '../../../../features/login/data/data_source/remote_data_source.dart';
import '../../../../features/login/data/repos_imple/login_repos_imple.dart';
import '../../../../features/login/domain/repos/login_repos.dart';
import '../../../../features/login/domain/usecases/login_with_passwordn_usecase.dart';
import '../../../../features/login/presentation/cubit/login_cubit.dart';
import '../../../../features/register/data/datasource/register_remote_data_source.dart';
import '../../../../features/register/data/repos/register_repo_imple.dart';
import '../../../../features/register/domain/repos/register_repos.dart';
import '../../../../features/register/domain/usecases/register_usecase.dart';
import '../../../../features/register/presentation/cubit/register_cubit.dart';
import 'api_service.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// External
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(
        () => ApiService(getIt<Dio>()),
  );

  /// Data Sources
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSource(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSource(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSource(
      apiService: getIt<ApiService>(),
    ),
  );

  /// Repositories
  getIt.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(
      remoteDataSource: getIt<RegisterRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<LoginRepos>(
        () => LoginReposImple(
          loginRemoteDataSource: getIt<LoginRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<HomeRepos>(
        () => HomeReposImple(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  /// Use Cases
  getIt.registerLazySingleton<RegisterUsecase>(
        () => RegisterUsecase(
      repository: getIt<RegisterRepository>(),
    ),
  );
  getIt.registerLazySingleton<LoginWithPasswordUseCase>(
        () => LoginWithPasswordUseCase(
          loginRepos: getIt<LoginRepos>(),
    ),
  );
  getIt.registerLazySingleton<GetAllCitiesUseCase>(
        () => GetAllCitiesUseCase(
      homeRepos: getIt<HomeRepos>(),
    ),
  );
  getIt.registerLazySingleton<GetAllBranchesByCityIdUseCase>(
        () => GetAllBranchesByCityIdUseCase(
      homeRepos: getIt<HomeRepos>(),
    ),
  );

  /// Cubit
  getIt.registerFactory<RegisterCubit>(
        () => RegisterCubit(
      registerUsecase: getIt<RegisterUsecase>(),
    ),
  );
  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(
      loginWithPasswordUseCase: getIt<LoginWithPasswordUseCase>(),
    ),
  );
  getIt.registerFactory<HomeCubit>(
        () => HomeCubit(
          getAllCitiesUseCase: getIt<GetAllCitiesUseCase>(),
          getAllBranchesByCityIdUseCase: getIt<GetAllBranchesByCityIdUseCase>(),
    ),
  );
}
