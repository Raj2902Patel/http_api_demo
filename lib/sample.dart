import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Posts.dart';


class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  // fetchData() async {
  //   var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   var response = await http.get(url);
  //   // print(response.body);
  //
  //   print(response.statusCode);
  //   // print(response.body);
  //
  //   Posts posts =  await Posts.fromJson(jsonEncode(response.body));
  //   print(posts.title);
  //
  //   // Posts posts = Posts.fromJson(response.body);
  //   // print(posts.title);
  //   // print(Posts.fromJson(response.body));
  // }

  fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);

    print(response.statusCode);

    if (response.statusCode == 200) {
      // Decode the JSON response
      var jsonData = jsonDecode(response.body);

      // If the API returns a list of items, you need to handle it as such
      if (jsonData is List) {
        // List<Posts> postsList = jsonData.map((item) => Posts.fromJson(item)).toList();
        List<Posts> postsList = jsonData.map((item) => Posts.fromJson(item)).toList();

        // Example: Print the title of the first post

        for(var i in postsList){
          print(i.id.toString());
          print(i.title);
        }

        // if (postsList.isNotEmpty) {
        //   print(postsList[0].title);
        // }
      } else
        if (jsonData is Map<String, dynamic>) {
        // If the API returns a single item
        Posts posts = Posts.fromJson(jsonData);
        print(posts.title);
      }
        else {
        print("Unexpected JSON structure: $jsonData");
      }
    } else {
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smaple"),
      ),
    );
  }
}
