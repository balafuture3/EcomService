import 'dart:convert';
import 'package:dio/dio.dart';
import '../values/strings.dart';


class ApiProvider
{
  final dio = Dio();
  ApiProvider()
  {
    dio.options.baseUrl = Strings.baseurl;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          print(options.uri);
          return handler.next(options);
        },
        onResponse:(response,handler) {
          print(response);
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return  handler.next(e);
        }
    ));
  }

  Future<Response> LoginAPI(email, password) async {
   Map data = {
      "mobileNumber":email,
      "password":password
    };
    print(jsonEncode(data));
    var response = await dio.post(
      '/eLogin.php',
      data: data,
      options: Options(
      headers: {
        "Content-Type": "application/json",
      },
    ));
    print(response.data);
    return response;

  }

}