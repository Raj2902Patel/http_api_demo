import 'package:flutter/material.dart';
import 'package:http_api_demo/http_get.dart';
import 'package:http_api_demo/sample.dart';

import 'extra.dart';
import 'http_delete.dart';
import 'http_post.dart';
import 'http_put.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeGet(),
    );
  }
}
