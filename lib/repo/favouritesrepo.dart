import 'package:ecomservice/network/api_error.dart';

import '../model/AddcartTest.dart';
import '../model/FavouritesDataResponse.dart';
import '../model/SucessResponse.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class FavouritesRepository
{
  final Dio dio;
  FavouritesRepository(this.dio);
  Future<ApiResponse> Favouritescall(userId)
  async {
    Map data={"userId":userId};
    try {
      Response response = await dio.post(UrlConstants.favouritesdataurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = FavouritesDataResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(FavouritesDataResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> FavoritesDeletecall(userId,productId)
  async {
    Map data = {"userId": userId,"productId":productId};
    try {
      Response response = await dio.post(UrlConstants.favouritedeleteurl,data: data);
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
  Future<ApiResponse> AddCartCall ( AddcartTest addcart)
  async {
    Response response = await dio.post(UrlConstants.addcarturl,data:addcart.toJson());
    bool? data1 = SuccessResponse.fromJson(response.data).status;
    try {
      if(data1!)
      {
        return ApiResponse.completed(SuccessResponse.fromJson(response.data));
      }
      else
        return ApiResponse.error(SuccessResponse.fromJson(response.data).message, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }


  }

}