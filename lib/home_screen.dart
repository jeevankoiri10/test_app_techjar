import 'package:flutter/material.dart';
import 'package:test_app_techjar/models/post_models.dart';
import 'package:test_app_techjar/network_manager/injection_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = [];
  bool isLoading = true;

  getPosts() {
    restClient.postList().then((value) {
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
                        ListTile(
                          leading: Text(
                            postList[index].id.toString() ?? '',
                            style: TextStyle(fontSize: 30, color: Colors.white),
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
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
