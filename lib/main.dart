import 'package:flutter/material.dart';
import 'package:test_app_techjar/home_screen.dart';
import 'package:test_app_techjar/pages/comment_screen.dart';
import 'package:test_app_techjar/pages/post_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Initialization of the path for caching
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationCacheDirectory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => PostScreen(),
      },
      title: 'TechJar Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
