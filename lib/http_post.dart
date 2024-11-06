import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePost extends StatefulWidget {
  const HomePost({super.key});

  @override
  State<HomePost> createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  postData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await http.post(url,
        body: jsonEncode({
          "title": titleController.text,
          "body": bodyController.text,
          "userId": 1,
        })
    );

    if (response.statusCode == 201) {
      print("Post created successfully!");
    } else {
      print("Failed to create post!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP POST'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Body"),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: postData,
              child: Text("Post Data"),
            ),
          ],
        ),
      ),
    );
  }
}