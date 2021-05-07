import 'package:daily_coding/config/config.dart';
import 'package:dio/dio.dart';
import 'package:daily_coding/pages/feed/feed_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:retrofit/retrofit.dart';

part 'restclient.g.dart';

abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('/get_tag_entry')
  Future<FeedEntity> getTagDataList(
    @Query('src') String src,
    @Query('tagId') String tagId,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('sort') String sort,
  );
}

Dio dio = initDio();

var client = RestClient(dio);

Dio initDio() {
  Dio dio = Dio();
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
    options.baseUrl = Config.JUE_JIN_BASE_URL;
    options.connectTimeout = 15000;

    print("请求URL:${options.path}");
    print("请求头:" + options.headers.toString());
    print("请求contentType:" + options.contentType.toString());
    // if (options?.data != null) {
    //   print("请求参数:" + options?.data);
    // }

    return handler.next(options);
  }, onResponse: (Response response, handler) {
    print("返回参数:" + response.toString());

    return handler.next(response);
  }, onError: (DioError err, handler) {
    print("请求异常:" + err.toString());
    // print("请求异常信息: " + err?.response.toString() ?? "");
    String msg;
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      msg = "请求超时";
      print(msg);
      Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
    } else {}

    // return dio.resolve({"errorCode": 500, 'msg': "请求异常", 'data': null});

    return handler.next(err);
  }));
  // dio.interceptors.add(CookieManager(CookieJar()));

  return dio;
}
