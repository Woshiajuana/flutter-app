
import 'package:dio/dio.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';

class HttpUtil {

  static BaseOptions _options = new BaseOptions(
//    baseUrl: "https://www.xx.com/api",
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Dio _dio = new Dio(_options);

  static request (String path, {
    data,
    BaseOptions options,
    CancelToken cancelToken,
  }) async {
    try {
      Response response = await _dio.request(path, data: data, cancelToken: cancelToken);
      print(response);
    } catch (e) {
      print(e);
    }
  }

}