import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app_techjar/models/post_models.dart';
part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('https://jsonplaceholder.typicode.com/posts')
  Future<List<PostModel>> postList();
}
