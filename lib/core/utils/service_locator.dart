import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo_implementation.dart';
import 'api_serves.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServes>(
    ApiServes(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRemoteDataSource: HomeRemoteDataSourceImp(
        apiServes: getIt.get<ApiServes>(),
      ),
    ),
  );
  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
      searchRemoteDataSource: SearchRemoteDataSourceImp(
        apiServes: getIt.get<ApiServes>(),
      ),
    ),
  );
}
