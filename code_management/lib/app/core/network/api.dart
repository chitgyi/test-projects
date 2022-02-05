import 'package:code_management/app/core/model/response/custom_response.dart';
import 'package:code_management/app/core/utils/constants/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET(EndPoints.upcommingMovies)
  Future<CustomResponse> getUpcommingMovies(
    @Query("api_key") String apiKey, {
    @Query("page") int page = 1,
  });

  @GET(EndPoints.popularMovies)
  Future<CustomResponse> getPopularMovies(
    @Query("api_key") String apiKey, {
    @Query("page") int page = 1,
  });
}
