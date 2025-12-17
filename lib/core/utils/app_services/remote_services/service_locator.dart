import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
}
