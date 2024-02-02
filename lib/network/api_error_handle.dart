import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../values/strings.dart';
import 'api_error.dart';

class APIErrorHandler extends Equatable {
  static final APIErrorHandler _apiErrorHandler = APIErrorHandler._internal();
  factory APIErrorHandler() {
    return _apiErrorHandler;
  }
  APIErrorHandler._internal();
  ApiResponse checkError(DioException dioError) {
    if (dioError.type == DioExceptionType.connectionError) {
      return ApiResponse.error(Strings.noInternet, 0);
    } else if (dioError.type == DioExceptionType.connectionTimeout ||
        dioError.type == DioExceptionType.receiveTimeout ||
        dioError.type == DioExceptionType.sendTimeout) {
      return ApiResponse.error(Strings.connectionTimeout, 0);
    } else if (dioError.type == DioExceptionType.badResponse) {
      switch (dioError.response?.statusCode) {
        case 401:
          return ApiResponse.error(
              Strings.unauthorized, dioError.response!.statusCode);
        case 403:
          return ApiResponse.error(
              Strings.forbidden, dioError.response!.statusCode);
        case 404:
          return ApiResponse.error(
              Strings.notFound, dioError.response!.statusCode);
        case 429:
          return ApiResponse.error(
              Strings.tooManyRequest, dioError.response!.statusCode);
        case 500:
          return ApiResponse.error(
              Strings.serverError, dioError.response!.statusCode);
        case 405:
          return ApiResponse.error(
              Strings.methodNotAllowed, dioError.response!.statusCode);
      }
    } else if (dioError.type == DioExceptionType.unknown)
      return ApiResponse.error(Strings.noInternet, 0);
    return ApiResponse.error(dioError.message, 0);
  }

  @override
  List<Object?> get props => [_apiErrorHandler];
}
