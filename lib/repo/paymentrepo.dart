import 'package:ecomservice/model/PaymentResponse.dart';
import 'package:ecomservice/model/SucessResponse.dart';

import '../network/api_error.dart';
import '../network/api_error_handle.dart';
import '../network/dio_helper.dart';
import '../network/urlConstants.dart';
import '../values/strings.dart';

class PaymentRepo
{
  final Dio dio;
  PaymentRepo(this.dio);
  Future<ApiResponse> Paymentlistcall(userId)
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
  Future<ApiResponse> DefaultPaymentcall(userId,id)
  async {
    try {
      Map data={"userId":userId,"id":id};
      print(data);
      Response response = await dio.post(UrlConstants.defaultpaymenturl,data: data);
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
  Future<ApiResponse> AddPaymnetcall(userId,name,cvv,cardNo,defaultPayment,expiry)
  async {
    try {
      Map data={
        "userId":userId,
        "name":name,
        "cvv":cvv,
        "cardNo":cardNo,
        "defaultPayment":defaultPayment,
        "expiry":expiry
      };
      Response response = await dio.post(UrlConstants.paymentaddurl,data: data);
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

Future<ApiResponse> DeletePaymentcall(userId,id)
async {
  try {
    Map data={"userId":userId,"id":id};
    print(data);
    Response response = await dio.post(UrlConstants.deletepaymenturl,data: data);
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