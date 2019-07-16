
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:woosai_mall/common/utils/printUtil.dart';

class HttpUtil {

  static BaseOptions _options = new BaseOptions(
    method: 'POST',
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Dio _dio = new Dio(_options);

  static request (String path, {
    data,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      PrintUtil.info('[$path] 请求发起参数=> $data');
      Response response = await _dio.request(path, data: data, cancelToken: cancelToken, options: options);
      PrintUtil.info('[$path] 请求返回结果=> $response');
      if (response.statusCode != HttpStatus.ok)
        throw('网络繁忙，请稍后再试');
      var respBody = response.data['data'] == null ? response.data['result'] : response.data['data'];
      var respCode = response.data['resp_code'];
      var respMessage = response.data['resp_message'];
      if (HttpConfig.SUCCESS_CODE.indexOf(respCode) == -1)
        throw(respMessage);
      return respBody;
    } catch (err) {
      PrintUtil.err(err);
      return new Future.error(err);
    }
  }

}