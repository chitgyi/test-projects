abstract class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "Network Error"]);

  @override
  String toString() {
    return message;
  }
}

// 200 success, 201 created, 202 accepted, 204 no content, 302 redirect, 401 unauthenticated, 402 unauthorized, 403 acess denied,400 bad request, 404 not found, 422 unable to process, 429 too many request, 500 server error

class InternetConnectionException extends NetworkException {
  InternetConnectionException([String message = "No Internet Connection!"])
      : super(message);
}

class InvalidResponseException extends NetworkException {
  InvalidResponseException([String message = "Invalid Response!"])
      : super(message);
}

class BadeRequestException extends NetworkException {
  BadeRequestException([String message = "Bad Request"]) : super(message);
}

class UnauthenticateException extends NetworkException {
  UnauthenticateException([String message = 'Unauthenticated'])
      : super(message);
}

class UnauthorizeException extends NetworkException {
  UnauthorizeException([String message = 'Unauthorized']) : super(message);
}

class AccesDeniedException extends NetworkException {
  AccesDeniedException([String message = 'Permission Denied']) : super(message);
}

class NotFoundException extends NetworkException {
  NotFoundException([String message = 'Not Found']) : super(message);
}

class UnableToProcessException extends NetworkException {
  UnableToProcessException([String message = 'Unable to Process'])
      : super(message);
}

class TooManyRequestException extends NetworkException {
  TooManyRequestException([String message = 'Too Many Request'])
      : super(message);
}

class ServerException extends NetworkException {
  ServerException(
      [String message =
          'Unable to connect server at this time. Please try again later!'])
      : super(message);
}
