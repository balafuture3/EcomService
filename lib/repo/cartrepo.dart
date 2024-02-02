import 'package:ecomservice/model/CartDetailResponse.dart';
import 'package:ecomservice/model/PromoResponse.dart';

import '../model/SucessResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class CartRepository
{
  final Dio dio;
  CartRepository(this.dio);
  Future<ApiResponse> Cartcall(userId)
  async {
    Map data={"userId":userId};
    try {
      Response response = await dio.post(UrlConstants.carturl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = CartDetailResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(CartDetailResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> FavoritesInsertcall(userId,productId)
  async {
    Map data = {"userId": userId,"productId":productId};
    try {
      Response response = await dio.post(UrlConstants.favouriteinserturl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = SuccessResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(SuccessResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }

  Future<ApiResponse> CartDeletecall(userId,productId)
  async {
    Map data = {"userId": userId,"productId":productId};
    try {
      Response response = await dio.post(UrlConstants.cartdeleteurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = SuccessResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(SuccessResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> PromoCodecall()
  async {
    try {
      Response response = await dio.get(UrlConstants.promourl);
      print("Status Code : ${response.statusCode}");
      var data1 = PromoResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(PromoResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
}