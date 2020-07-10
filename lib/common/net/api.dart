import 'package:dio/dio.dart';
import 'package:flutter_dojo/common/net/baseentity.dart';

const String BASE_API_URL = '';
const String TEST_URL_PATH = '';

enum Method {
  GET,
  POST,
  DELETE,
  PUT,
}

const MethodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
  Method.DELETE: 'delete',
  Method.PUT: 'put',
};

typedef HttpSuccessCallback<T> = void Function(T data);
typedef HttpFailureCallback = void Function(ErrorEntity data);

class DioManager {
  Dio dio;

  static final DioManager _internalDio = DioManager._internal();

  factory DioManager() => _internalDio;

  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: BASE_API_URL,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: 30000,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
    }
  }

  // requestOptions可以重置Option
  Future request<T>(
    Method method,
    String path, {
    Map params,
    RequestOptions requestOptions,
    HttpSuccessCallback<T> success,
    HttpFailureCallback error,
  }) async {
    try {
      Response response = await dio.request(
        path,
        queryParameters: params,
        options: Options(method: MethodValues[method]),
      );
      if (response != null) {
        BaseEntity entity = BaseEntity<T>.fromJson(response.data);
        if (entity.code == 0) {
          success(entity.data);
        } else {
          error(ErrorEntity(code: entity.code, message: entity.message));
        }
      } else {
        error(ErrorEntity(code: -1, message: '未知错误'));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: '请求取消');
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: '连接超时');
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: '请求超时');
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: '响应超时');
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: '请求语法错误');
                break;
              case 403:
                return ErrorEntity(code: errCode, message: '服务器拒绝执行');
                break;
              case 404:
                return ErrorEntity(code: errCode, message: '无法连接服务器');
                break;
              case 405:
                return ErrorEntity(code: errCode, message: '请求方法被禁止');
                break;
              case 500:
                return ErrorEntity(code: errCode, message: '服务器内部错误');
                break;
              case 502:
                return ErrorEntity(code: errCode, message: '无效的请求');
                break;
              case 503:
                return ErrorEntity(code: errCode, message: '服务器挂了');
                break;
              case 505:
                return ErrorEntity(code: errCode, message: '不支持HTTP协议请求');
                break;
              default:
                return ErrorEntity(code: errCode, message: '未知错误');
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: '未知错误');
          }
        }
        break;
      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }
}
