import 'package:ecomservice/model/PaymentResponse.dart';
import 'package:ecomservice/model/SucessResponse.dart';

import '../model/ShippingResponse.dart';
import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class ShippingRepo
{
  final Dio dio;
  ShippingRepo(this.dio);
  Future<ApiResponse> Shippinglistcall(userId)
  async {
    try {
      Map data={"userId":userId};
      print(data);
      Response response = await dio.post(UrlConstants.shippingurl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = ShippingResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(ShippingResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> DefaultShippingcall(userId,id)
  async {
    try {
      Map data={"userId":userId,"id":id};
      print(data);
      Response response = await dio.post(UrlConstants.defaultshippingurl,data: data);
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
  Future<ApiResponse> AddShippingcall(userId,name,address,city,state,country,zipcode)
  async {
    try {
      Map data={
        "userId":userId,
        "name":name,
        "address" :address,
        "city" :city,
        "state":state,
        "country":country ,
        "zipcode":zipcode ,
        "defaultAddress" :0
      };
      Response response = await dio.post(UrlConstants.shippingaddurl,data: data);
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

  Future<ApiResponse> DeleteShippingcall(userId,id)
  async {
    try {
      Map data={"userId":userId,"id":id};
      print(data);
      Response response = await dio.post(UrlConstants.deleteshippingurl,data: data);
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