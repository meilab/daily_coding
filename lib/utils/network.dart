import 'package:daily_coding/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger('network.dart');

class Network {
  static Dio dio = Dio();

  Network() {
    // Start logger.  MAKE SURE STRING IS NAME OF DART FILE WHERE
    // CODE IS (in this case the filename is mqtt_stream.dart)
    // TBD: I could not find a way to get the API to return the filename.
  }

  static init() {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.connectTimeout = 15000;

      _logger.info("请求URL:${options.path}");
      _logger.info("请求头:" + options.headers.toString());
      _logger.info("请求contentType:" + options.contentType.toString());
      // if (options?.data != null) {
      //   print("请求参数:" + options?.data);
      // }

      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      _logger.info("返回参数:" + response.toString());

      return handler.next(response);
    }, onError: (DioError err, ErrorInterceptorHandler handler) {
      _logger.warning("请求异常:" + err.toString());
      // print("请求异常信息: " + err?.response.toString() ?? "");
      String msg;
      if (err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.receiveTimeout) {
        msg = "请求超时";
        _logger.warning(msg);
        if (isMobile) {
          Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
        }
      } else {}

      // return dio.resolve({"errorCode": 500, 'msg': "请求异常", 'data': null});

      return handler.next(err);
    }));
    // dio.interceptors.add(CookieManager(CookieJar()));
  }
}
