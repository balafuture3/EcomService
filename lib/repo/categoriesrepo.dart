import 'package:ecomservice/model/CategoryResponse.dart';

import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class CategoryRepository
{
  final Dio dio;
  CategoryRepository(this.dio);
  Future<ApiResponse> Categorycall()
  async {
    try {
      Response response = await dio.post(UrlConstants.categoryurl);
      print("Status Code : ${response.statusCode}");
      var data1 = CategoryResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(CategoryResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
}