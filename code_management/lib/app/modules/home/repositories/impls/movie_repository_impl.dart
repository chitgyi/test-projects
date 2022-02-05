import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/modules/home/datasources/local/movie_local_datasource.dart';
import 'package:code_management/app/modules/home/datasources/remote/movie_remote_datasource.dart';
import 'package:code_management/app/modules/home/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalDataSource localDataSource;
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> fetchPopularMovies({int page = 1}) async {
    final movies = await remoteDataSource.popularMovies(page: page);
    await localDataSource.saveMovies(movies);
  }

  @override
  Future<void> fetchUpcommingMovies({int page = 1}) async {
    final movies = await remoteDataSource.upcommingMovies(page: page);
    await localDataSource.saveMovies(movies);
  }

  @override
  Future<List<MovieWithFavorite>> getPopularMovies({int page = 1}) =>
      localDataSource.popularMovies(page: page);

  @override
  Future<List<MovieWithFavorite>> getUpcommingMovies({int page = 1}) =>
      localDataSource.upcommingMovies(page: page);

  @override
  Future<void> setFavoriteMovie(Favorite favorite) =>
      localDataSource.setFavorite(favorite);
}
