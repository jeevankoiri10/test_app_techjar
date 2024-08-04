import 'package:flutter/material.dart';
import 'package:test_app_techjar/models/post_model.dart';
import 'package:test_app_techjar/network_manager/injection_container.dart';
import 'package:test_app_techjar/pages/comment_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> postList = [];
  bool isLoading = true;

  getPosts() {
    restClient.fetchPostList().then((value) {
      setState(() {
        postList = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      // errors
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPosts();
    super.initState();
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // margin: EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CommentScreen(
                                  post_id: postList[index].id ?? 1,
                                ),
                              ),
                            );
                            debugPrint(
                                'clicked ${postList[index].id.toString() ?? ''}');
                          },
                          child: ListTile(
                            leading: Text(
                              postList[index].id.toString() ?? '',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            title: Text(
                              postList[index].title ?? '',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              postList[index].body ?? '',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
