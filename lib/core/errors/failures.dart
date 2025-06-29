import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with server');

      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate');

      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final responseData = dioException.response?.data;
        return ServerFailure.fromResponse(statusCode, responseData);

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request was canceled');

      case DioExceptionType.connectionError:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(errorMessage: 'No internet connection');
        }
        return ServerFailure(
            errorMessage: 'Unexpected error, please try again');

      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage:
              dioException.message ?? 'There was an error, please try again',
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (response == null) {
      return ServerFailure(errorMessage: 'Unknown error occurred');
    }

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errorMessage: response['error']?['message'] ?? 'Authorization error',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Your request was not found, please try later',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, please try later',
      );
    } else {
      return ServerFailure(
        errorMessage: 'Something went wrong, please try again',
      );
    }
  }
}
