import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeDelete extends StatefulWidget {
  const HomeDelete({super.key});

  @override
  State<HomeDelete> createState() => _HomeDeleteState();
}

class _HomeDeleteState extends State<HomeDelete> {

  deleteData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1");
    var response = await http.delete(url,
        body: {
          "title": "api demo put",
        }
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Successfully Deleted data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HTTP Delete Api"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Delete Data"),
            onPressed: () {
              deleteData();
            },
          ),
        )
    );
  }
}
