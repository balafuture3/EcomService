import 'package:ecomservice/model/CategoryResponse.dart';
import 'package:ecomservice/model/PaymentResponse.dart';
import 'package:ecomservice/model/ShippingResponse.dart';
import 'package:ecomservice/model/SucessResponse.dart';

import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class CheckoutRepo
{
  final Dio dio;
  CheckoutRepo(this.dio);
  Future<ApiResponse> Paymentcall(userId)
  async {
    try {
      Map data={"userId":userId};
      print(data);
      Response response = await dio.post(UrlConstants.paymenturl,data: data);
      print("Status Code : ${response.statusCode}");
      var data1 = PaymentResponse.fromJson(response.data).status;
      if (data1 == true)
        return ApiResponse.completed(PaymentResponse.fromJson(response.data));
      else
        return ApiResponse.error(Strings.tryAgain, 0);
    } on DioException catch (dioError) {
      print(dioError);
      return APIErrorHandler().checkError(dioError);
    }

  }
  Future<ApiResponse> Shippingcall(userId)
  async {
    try {
      Map data={"userId":userId};
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
  Future<ApiResponse> PlaceOrdercall(userId,orderTotal,paymentId,shippingId,paymentStatus,promoPercent,promoCode,details,)
  async {
    try {
      Map data={
        "userId":userId,
        "orderTotal":orderTotal,
        "paymentId":paymentId,
        "shippingId":shippingId,
        "paymentStatus":paymentStatus,
        "promoPercent":promoPercent,
        "promoCode":promoCode,
        "details":details,
        "createdBy":"1234",
        "updatedBy":"1234"
      };
      Response response = await dio.post(UrlConstants.placeorderurl,data: data);
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
  Future<ApiResponse> CartDeletecall(userId)
  async {
    Map data = {"userId": userId};
    try {
      Response response = await dio.post(UrlConstants.cartdeletebyuserurl,data: data);
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