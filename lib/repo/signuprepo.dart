import 'package:dio/dio.dart';
import 'package:ecomservice/network/urlConstants.dart';

import '../model/SucessResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';

class SignupRepository {
  final dio;
  SignupRepository(this.dio);
  Future<ApiResponse> Signupcall(
      name, email, mobilenumber, passowrd, address, latitude, longitude) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "mobileNumber": mobilenumber,
      "categoryId": 1,
      "password": passowrd,
      "address": address,
      "latitude": latitude,
      "longitude": longitude,
      "profilePhoto": "",
      "firebaseId": "",
      "createdBy": "1234",
      "updatedBy": "1234"
    };
    try {
      Response response = await dio.post(UrlConstants.signupUrl, data: data);

      var data1 = SuccessResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(SuccessResponse.fromJson(response.data));
      else
        return ApiResponse.error(
            SuccessResponse.fromJson(response.data).message, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }
  }
}
