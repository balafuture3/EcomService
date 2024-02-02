import 'dart:io';

import 'package:ecomservice/network/urlConstants.dart';

import '../values/strings.dart';
import 'dio_helper.dart';

export 'package:dio/dio.dart';

class DioHelper {
  static final DioHelper _dioHelper = DioHelper._internal();
  Dio? _dio;
  // late CookieManager _cookieManager;

  factory DioHelper() {
    return _dioHelper;
  }

  DioHelper._internal() {
    _setUpDioConfiguration();
    _setupLogInterceptor();
  }

  getInstance() {
    if (_dio == null) {
      _setUpDioConfiguration();
      _setupLogInterceptor();
    }
    return _dio;
  }

  void _setUpDioConfiguration() {
    BaseOptions options =
        BaseOptions(receiveDataWhenStatusError: true, baseUrl: UrlConstants.baseurl);
    _dio = Dio(options);
    _dio?.options.followRedirects = false;
    _dio?.options.connectTimeout = const Duration(seconds: 10);
    _dio?.options.headers[HttpHeaders.acceptHeader] = "application/json";
    _dio?.options.validateStatus = (status) => status! <= 400;
    _dio?.transformer = JsonTransformer();

    // var cookieJar = CookieJar();
    // _cookieManager = CookieManager(cookieJar);
    // _dio?.interceptors.add(_cookieManager);

    // _dio?.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) async {
    //       return handler.next(options);
    //     },
    //     onError: (error, handler) {
    //       if (error.response?.statusCode == 401) {
    //
    //       } else {
    //         handler.next(error);
    //       }
    //     },
    //   ),
    // );
  }

  _setupLogInterceptor() {
    _dio?.interceptors.add(LogInterceptor(responseBody: true));
  }
}

//This transformer runs the json decoding in a background thread.
//Thus returing a Future of Map
class JsonTransformer extends BackgroundTransformer {
  JsonTransformer() : super();
}
