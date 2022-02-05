import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieWithFavorite>> upcommingMovies({int page = 1});
  Future<List<MovieWithFavorite>> popularMovies({int page = 1});
  Future<void> setFavorite(Favorite favorite);
  Future<void> saveMovies(List<Movie> moives);
}
