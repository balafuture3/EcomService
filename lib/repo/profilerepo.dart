import 'package:ecomservice/model/ProfileResponse.dart';
import 'package:ecomservice/model/SucessResponse.dart';

import '../model/SimilarProductResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class ProfileRepo {
  final dio;
  ProfileRepo(this.dio);
  Future<ApiResponse> ProfileUploadCall(id, file, filename) async {
    var data = FormData.fromMap({
      'IMAGE': await MultipartFile.fromFile(file, filename: filename),
      'id': id
    });
    Response response =
        await dio.post(UrlConstants.profileuploadurl, data: data);
    bool? data1 = SuccessResponse.fromJson(response.data).status;
    try {
      if (data1!) {
        return ApiResponse.completed(SuccessResponse.fromJson(response.data));
      } else
        return ApiResponse.error(
            SuccessResponse.fromJson(response.data).message, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }
  }
  Future<ApiResponse> ProfileInitcall(userId)
  async {
    Map data = {"userId": userId};
    print(data);
    try {
      Response response = await dio.post(UrlConstants.profileiniturl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = ProfileResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(ProfileResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
}
