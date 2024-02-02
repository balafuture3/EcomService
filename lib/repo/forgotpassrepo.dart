import '../model/SucessResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';

class ForgotPassRepository {
  final dio;
  ForgotPassRepository(this.dio);
  Future<ApiResponse> Forgotpasscall( email, mobilenumber, passowrd) async {
    Map<String, dynamic> data = {
      "email": email,
      "mobileNumber": mobilenumber,
      "password": passowrd
    };
    try {
      Response response = await dio.post(UrlConstants.forgotpassUrl, data: data);

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