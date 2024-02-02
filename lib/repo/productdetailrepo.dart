import 'package:ecomservice/model/ProductDetailResponse.dart';
import 'package:ecomservice/model/SimilarProductResponse.dart';
import 'package:ecomservice/network/api_error.dart';
import 'package:ecomservice/network/urlConstants.dart';

import '../model/AddCartRequest.dart';
import '../model/AddcartTest.dart';
import '../model/SucessResponse.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';

class ProductDetailRepository {
  final Dio dio;
  ProductDetailRepository(this.dio);


 Future<ApiResponse> ProductCall ( int id)
  async {
    Map data ={"productId":id};
    Response response = await dio.post(UrlConstants.productdetailurl,data:data);
    bool? data1 = ProductDetailResponse.fromJson(response.data).status;
    try {
      if(data1!)
        {
         return ApiResponse.completed(ProductDetailResponse.fromJson(response.data));
        }
      else
        return ApiResponse.error(ProductDetailResponse.fromJson(response.data).message, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }
    
    
  }

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
