import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/network/api.dart';
import 'package:code_management/app/modules/home/datasources/local/impls/movie_local_datasource_impl.dart';
import 'package:code_management/app/modules/home/datasources/local/movie_local_datasource.dart';
import 'package:code_management/app/modules/home/datasources/remote/impls/movie_remote_datasource_impl.dart';
import 'package:code_management/app/modules/home/datasources/remote/movie_remote_datasource.dart';
import 'package:code_management/app/modules/home/repositories/impls/movie_repository_impl.dart';
import 'package:code_management/app/modules/home/repositories/movie_repository.dart';
import 'package:get/get.dart';
import 'package:code_management/app/modules/home/view_models/movie_view_model.dart';

class MovieBindings extends Bindings {
  @override
  void dependencies() {
    Get.create<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl(Get.find<Api>()));
    Get.create<MovieLocalDataSource>(() => MovieLocalDataSourceImpl(Get.find<Database>().moviesDao));
    Get.create<MovieRepository>(
      () => MovieRepositoryImpl(
        localDataSource: Get.find<MovieLocalDataSource>(),
        remoteDataSource: Get.find<MovieRemoteDataSource>(),
      ),
    );

    Get.create<MoiveViewModel>(
      () => MoiveViewModel(Get.find<MovieRepository>()),
    );
  }
}
