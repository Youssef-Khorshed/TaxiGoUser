class InternetConnectionException implements Exception {}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class LocalException implements Exception {
  final String message;
  LocalException({required this.message});
}

class UnExpectedException implements Exception {
  final String message;
  UnExpectedException({required this.message});
}

class NoInternetException implements Exception {
  final String message;
  NoInternetException({required this.message});
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException({required this.message});
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({required this.message});
}

class ForbiddenException implements Exception {
  final String message;
  ForbiddenException({required this.message});
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException({required this.message});
}

class ServiceException implements Exception {
  final String message;
  ServiceException({required this.message});
}

class PermissionException implements Exception {
  final String message;
  PermissionException({required this.message});
}
