import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeGet extends StatefulWidget {
  const HomeGet({super.key});

  @override
  State<HomeGet> createState() => _HomeGetState();
}

class _HomeGetState extends State<HomeGet> {

  List DataList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    var data = jsonDecode(response.body);
    setState(() {
      DataList = data ;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP API"),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: ListTile(
                  title: Text(DataList[index]["title"]),
                  leading: Image.network(DataList[index]["image"], height: 50,width: 50,),
                  trailing: Text(DataList[index]["price"].toString()),
                  subtitle: Text(DataList[index]["category"]),
                ),
              ),
            );
          },
        itemCount: DataList.length,
      ),
    );
  }
}
