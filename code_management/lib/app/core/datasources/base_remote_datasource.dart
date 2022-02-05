import 'package:code_management/app/core/exceptions/network_exception.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  NetworkException handleNetworkError(DioError error) {
    if (error.message.toLowerCase().contains('socketexception')) {
      return InternetConnectionException();
    }

    if (error.type == DioErrorType.other) {
      return InvalidResponseException();
    }

    switch (error.response!.statusCode) {
      case 401:
        return UnauthenticateException();
      case 402:
        return UnauthorizeException();
      case 403:
        return AccesDeniedException();
      case 404:
        return NotFoundException();
      case 422:
        return UnableToProcessException();
      case 429:
        return TooManyRequestException();
      case 500:
        return ServerException();
    }

    if (error.response!.statusCode! > 500) {
      return ServerException();
    }

    return UnableToProcessException();
  }
}
