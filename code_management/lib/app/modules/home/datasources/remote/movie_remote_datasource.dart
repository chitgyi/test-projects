import 'package:code_management/app/core/database/my_db.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> upcommingMovies({int page = 1});
  Future<List<Movie>> popularMovies({int page = 1});
}
