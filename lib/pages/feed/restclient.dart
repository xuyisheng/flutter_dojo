import 'package:dio/dio.dart';
import 'package:flutter_dojo/pages/feed/feed_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'restclient.g.dart';

@RestApi(baseUrl: 'https://timeline-merger-ms.juejin.im/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/get_tag_entry')
  Future<FeedEntity> getTagDataList(
    @Query('src') String src,
    @Query('tagId') String tagId,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
    @Query('sort') String sort,
  );
}

var client = RestClient(Dio());
