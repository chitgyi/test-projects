import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';

abstract class MovieRepository {
  Future<void> fetchUpcommingMovies({int page = 1});
  Future<void> fetchPopularMovies({int page = 1});
  Future<List<MovieWithFavorite>> getUpcommingMovies({int page = 1});
  Future<List<MovieWithFavorite>> getPopularMovies({int page = 1});
  Future<void> setFavoriteMovie(Favorite favorite);
}
