import '../model/ImagePickerModel.dart';
import '../model/MyOrdersResponse.dart';
import '../model/OrderDetailResponse.dart';
import '../model/SucessResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class MyOrderDetailRepo
{
  final Dio dio;
  MyOrderDetailRepo(this.dio);
  Future<ApiResponse> MyOrderscall(orderId)
  async {
    Map data = {"orderId": orderId};
    try {
      Response response = await dio.post(UrlConstants.myorderdetailurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = OrderDetailResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(OrderDetailResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }
  }
  Future<ApiResponse> RatingsCall(productId,Data1 file, ratings,comments,userId) async {
    var data = FormData.fromMap({
      'IMAGE': [
        for(int i=0;i<file.list1.length;i++)
        await MultipartFile.fromFile(file.list1[i], filename: file.list1[i])
      ],

      'productId': productId,
      "ratings":ratings,
      "comments":comments,
      "userId":userId
    });
    Response response =
    await dio.post(UrlConstants.ratingsinserturl, data: data);
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
}