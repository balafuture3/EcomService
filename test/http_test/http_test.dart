import 'dart:io';

import 'package:ecomservice/network/api_error.dart';
import 'package:ecomservice/network/api_error_handle.dart';
import 'package:ecomservice/network/dio_helper.dart';
import 'package:ecomservice/values/strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('APIErrorHandler test', () {
    late APIErrorHandler handler;
    DioException exception;
    setUp(() {
      EquatableConfig.stringify = true;
      handler = APIErrorHandler();
      exception = DioException(
          requestOptions: RequestOptions(), type: DioExceptionType.badResponse);
    });
    test(
      "APIError ",
          () {
        expect(
            ApiResponse.loading("message").toString(),"Status : Status.LOADING \n Message : message \n Data : null"
        );
      },
    );
    test(
      "APIError ",
          () {
        expect(
            handler.props,[handler]
        );
      },
    );
    test(
      "APIErrorHandler connectionError",
      () {
        expect(
            ApiResponse.error(Strings.noInternet, 0),
            handler.checkError(DioException.connectionError(
                requestOptions: RequestOptions(), reason: "reason")));
      },
    );
    test(
      "APIErrorHandler connectionTimeout",
      () {
        expect(
            ApiResponse.error(Strings.connectionTimeout, 0),
            handler.checkError(DioException.connectionTimeout(
                requestOptions: RequestOptions(),
                timeout: Duration(milliseconds: 10))));
      },
    );

    test("APIErrorHandler unauthorized", () {
      exception = DioException(

          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.unauthorized,);
      expect(ApiResponse.error(Strings.unauthorized, 401).status,
          handler.checkError(exception).status);
      expect(ApiResponse.error(Strings.unauthorized, 401).message,
          handler.checkError(exception).message);
    });
    test("APIErrorHandler forbidden", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.forbidden);
      expect(ApiResponse.error(Strings.forbidden, 403).toString(),
          handler.checkError(exception).toString());
      expect(ApiResponse.error(Strings.forbidden, 403).message,
          handler.checkError(exception).message);
    });
    test("APIErrorHandler notFound", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.notFound);
      expect(ApiResponse.error(Strings.notFound, 404).toString(),
          handler.checkError(exception).toString());

    });
    test("APIErrorHandler tooManyRequest", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.tooManyRequest);
      expect(ApiResponse.error(Strings.tooManyRequest, 429).status,
          handler.checkError(exception).status);
      expect(ApiResponse.error(Strings.tooManyRequest, 429).message,
          handler.checkError(exception).message);
    });
    test("APIErrorHandler serverError", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.serverError);
      expect(ApiResponse.error(Strings.serverError, 500).status,
          handler.checkError(exception).status);
      expect(ApiResponse.error(Strings.serverError, 500).message,
          handler.checkError(exception).message);
    });
    test("APIErrorHandler methodNotAllowed", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          message: Strings.methodNotAllowed);
      expect(ApiResponse.error(Strings.methodNotAllowed, 405).status,
          handler.checkError(exception).status);
      expect(ApiResponse.error(Strings.methodNotAllowed, 405).message,
          handler.checkError(exception).message);
    });
    test("APIErrorHandler methodNotAllowed", () {
      exception = DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.unknown,
          message: Strings.methodNotAllowed);
      expect(ApiResponse.error(Strings.noInternet, 0).status,
          handler.checkError(exception).status);
      expect(ApiResponse.error(Strings.noInternet, 0).message,
          handler.checkError(exception).message);
    });
    test("Dio Helper", () {
      expect(DioHelper().getInstance(),DioHelper().getInstance());
    });
  });
}
