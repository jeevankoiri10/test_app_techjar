import 'package:flutter/material.dart';
import 'package:test_app_techjar/models/comment_model.dart';
import 'package:test_app_techjar/models/post_model.dart';
import 'package:test_app_techjar/network_manager/injection_container.dart';
import 'package:dio/dio.dart';

class CommentScreen extends StatefulWidget {
  final int post_id;
  CommentScreen({super.key, required this.post_id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  PostModel? _post;
  List<CommentModel>? _comments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPostAndComments();
  }

  Future<void> _fetchPostAndComments() async {
    try {
      final postId = widget.post_id;
      final post = await restClient.fetchOnePost(postId);
      final comments = await restClient.fetchComments(postId);
      setState(() {
        _post = post;
        _comments = comments;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching post or comments: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('TechJar Test App'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_post != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _post!.title ?? '',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                _post!.body ?? '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (_comments != null && _comments!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Comments:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (_comments != null && _comments!.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _comments?.length ?? 0,
                      itemBuilder: (context, index) {
                        final comment = _comments![index];
                        return ListTile(
                          title: Text(comment.name ?? ''),
                          subtitle: Text(comment.body ?? ''),
                          leading: CircleAvatar(
                            child: Text(comment.id.toString()),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
    );
  }
}
