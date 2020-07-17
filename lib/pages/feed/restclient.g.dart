// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://timeline-merger-ms.juejin.im/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getTagDataList(src, tagId, page, pageSize, sort) async {
    ArgumentError.checkNotNull(src, 'src');
    ArgumentError.checkNotNull(tagId, 'tagId');
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(pageSize, 'pageSize');
    ArgumentError.checkNotNull(sort, 'sort');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'src': src,
      r'tagId': tagId,
      r'page': page,
      r'pageSize': pageSize,
      r'sort': sort
    };
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/get_tag_entry',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FeedEntity.fromJson(_result.data);
    return value;
  }
}
