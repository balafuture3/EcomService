import 'package:ecomservice/model/MyOrdersResponse.dart';

import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class MyOrdersRepo
{
  final Dio dio;
  MyOrdersRepo(this.dio);
  Future<ApiResponse> MyOrderscall(userId)
  async {
    Map data = {"userId": userId};
    try {
      Response response = await dio.post(UrlConstants.myordersurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = MyOrdersResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(MyOrdersResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
}