import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/exceptions/db_exception.dart';
import 'package:code_management/app/core/model/movie_with_fav.dart';
import 'package:code_management/app/core/utils/movie_type.dart';
import 'package:code_management/app/modules/home/datasources/local/doas/movie_dao.dart';
import 'package:code_management/app/modules/home/datasources/local/movie_local_datasource.dart';

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final MoviesDao _moviesDao;
  MovieLocalDataSourceImpl(this._moviesDao);

  @override
  Future<List<MovieWithFavorite>> popularMovies({int page = 1}) {
    try {
      return _moviesDao.getAllMovies(MovieType.popular, page: page);
    } catch (e) {
      throw ReadException();
    }
  }

  @override
  Future<List<MovieWithFavorite>> upcommingMovies({int page = 1}) async {
    try {
      return _moviesDao.getAllMovies(MovieType.upcoming, page: page);
    } catch (e) {
      throw ReadException();
    }
  }

  @override
  Future<void> saveMovies(List<Movie> moives) {
    try {
      return _moviesDao.insertAll(moives);
    } catch (e) {
      throw InsertException();
    }
  }

  @override
  Future<void> setFavorite(Favorite favorite) {
    try {
      return _moviesDao.setFavorite(favorite);
    } catch (e) {
      throw UpdateException();
    }
  }
}
