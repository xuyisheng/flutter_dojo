import 'package:dio/dio.dart';
import 'package:flutter_dojo/pages/feed/feed_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'restclient.g.dart';

/// Step 1: flutter pub upgrade
/// Step 2: flutter pub run build_runner build
@RestApi(baseUrl: 'https://api.github.com/search/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/repositories')
  Future<FeedEntity> getTagDataList(
    @Query('q') String q,
    @Query('sort') String sort,
    @Query('order') String order,
    @Query('page') int page,
    @Query('per_page') int perPage,
  );
}

var client = RestClient(Dio());
