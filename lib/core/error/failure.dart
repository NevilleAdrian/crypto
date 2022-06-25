import 'app_exceptions.dart';

abstract class Failure {
  final Object properties;
  Failure([this.properties = const Object()]) : super();
}

class AuthFailure extends Failure {
  final String message;

  AuthFailure({required this.message});
}

class UnknownFailure extends Failure {
  final String message;

  UnknownFailure(this.message);
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}

Failure handleException(Exception e) {
  if (e is ServerException) {
    return ServerFailure(e.message);
  } else if (e is AuthException) {
    return AuthFailure(message: e.message);
  } else {
    return UnknownFailure("An Unknown Error occurred");
  }
}
