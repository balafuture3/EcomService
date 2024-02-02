import 'package:ecomservice/model/DashinitResponse.dart';
import 'package:ecomservice/model/FavouritesResponse.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:ecomservice/network/urlConstants.dart';
import '../model/CartDetailResponse.dart';
import '../model/SearchResponse.dart';
import '../model/SucessResponse.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../values/strings.dart';

class DashboardRepository
{
  final Dio dio;
  DashboardRepository(this.dio);

  Future<ApiResponse> DashInitcall(limit,offset)
  async {
    try {
      Map data = {"userId": Strings.userid,
        "limit":limit,
        "offset":offset};
      Response response = await dio.post(UrlConstants.dashiniturl,data:data);
      print("Status Code : ${response.statusCode}");
      var data1 = DashinitResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(DashinitResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> DashSearchcall(query)
  async {
    Map data = {"productId": query};
    try {
      Response response = await dio.post(UrlConstants.searchurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = SearchResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(SearchResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> Favoritescall(query)
  async {
    Map data = {"userId": query};
    try {
      Response response = await dio.post(UrlConstants.favouritesurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = FavouritesResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(FavouritesResponse.fromJson(response.data));
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
}