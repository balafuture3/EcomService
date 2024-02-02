import 'package:ecomservice/model/SimilarProductResponse.dart';

import '../model/FavouritesResponse.dart';
import '../model/SucessResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class ProductListRepository {
  final Dio dio;

  ProductListRepository(this.dio);


  Future<ApiResponse> SimilarProductCall ( int id,limit,offset)
  async {
    Map data ={"catid":id,"limit":limit,"offset":offset};
    Response response = await dio.post(UrlConstants.similarproducturl,data:data);
    bool? data1 = SimilarProductResponse.fromJson(response.data).status;
    try {
      if(data1!)
      {
        return ApiResponse.completed(SimilarProductResponse.fromJson(response.data));
      }
      else
        return ApiResponse.error(SimilarProductResponse.fromJson(response.data).message, 0);
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
      print("Status Code : ${response.data}");
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
    print(data);
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
}
