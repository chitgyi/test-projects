import 'package:code_management/app/core/database/my_db.dart';
import 'package:code_management/app/core/datasources/base_remote_datasource.dart';
import 'package:code_management/app/core/network/api.dart';
import 'package:code_management/app/core/utils/constants/strings.dart';
import 'package:code_management/app/core/utils/movie_type.dart';
import 'package:code_management/app/modules/home/datasources/remote/movie_remote_datasource.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSourceImpl extends BaseRemoteDataSource
    implements MovieRemoteDataSource {
  final Api _api;

  MovieRemoteDataSourceImpl(this._api);

  @override
  Future<List<Movie>> upcommingMovies({int page = 1}) async {
    try {
      final response = await _api.getUpcommingMovies(apiKey, page: page);
      return (response.results as List)
          .map((e) => Movie.fromJson({
                ...e,
                'page': page,
                'type': MovieType.upcoming.name,
              }))
          .toList();
    } on DioError catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<List<Movie>> popularMovies({int page = 1}) async {
    try {
      final response = await _api.getPopularMovies(apiKey, page: page);
      return (response.results as List)
          .map((e) => Movie.fromJson({
                ...e,
                'page': page,
                'type': MovieType.popular.name,
              }))
          .toList();
    } on DioError catch (e) {
      throw handleNetworkError(e);
    }
  }
}
