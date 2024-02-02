import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../model/LoginResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class LoginRepository {
  final Dio dio;
  LoginRepository(this.dio);
  Future<dynamic> LoginAPI(email, password) async {
    Map data = {"mobileNumber": email, "password": password};
    try {
      Response response = await dio.post(UrlConstants.loginUrl, data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = LoginResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(LoginResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.unauthorized, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }
  }
}
