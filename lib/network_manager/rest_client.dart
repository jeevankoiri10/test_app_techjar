import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app_techjar/models/comment_model.dart';
import 'package:test_app_techjar/models/post_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('https://jsonplaceholder.typicode.com/posts')
  Future<List<PostModel>> fetchPostList();

  @GET('https://jsonplaceholder.typicode.com/posts/{post_id}')
  Future<PostModel> fetchOnePost(@Path("post_id") int postId);

  @GET('https://jsonplaceholder.typicode.com/posts/{post_id}/comments')
  Future<List<CommentModel>> fetchComments(@Path("post_id") int postId);

  @GET('post')
  Future<String> cancelRequest(
    @CancelRequest() CancelToken cancelToken,
  );
}
