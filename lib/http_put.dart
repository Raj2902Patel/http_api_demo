import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePut extends StatefulWidget {
  const HomePut({super.key});

  @override
  State<HomePut> createState() => _HomePutState();
}

class _HomePutState extends State<HomePut> {

  putData() async{
   var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
    var response = await http.put(url,
        body: {
            "name": "abcd",
            "title": "api demo put",
        }
    );
    print(response.statusCode);
   if (response.statusCode == 200) {
     print('Successfully Update data');
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Put Api"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Put Data"),
          onPressed: () {
            putData();
          },
        ),
      )
    );
  }
}
