// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://api.github.com/search/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTagDataList(q, sort, order, page, per_page) async {
    ArgumentError.checkNotNull(q, 'q');
    ArgumentError.checkNotNull(sort, 'sort');
    ArgumentError.checkNotNull(order, 'order');
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(per_page, 'per_page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': q,
      r'sort': sort,
      r'order': order,
      r'page': page,
      r'per_page': per_page
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/repositories',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: <String, dynamic>{}, extra: _extra, baseUrl: baseUrl),
        data: _data);
    final value = FeedEntity.fromJson(_result.data);
    return value;
  }
}
