import 'package:flutter/material.dart';
// import 'package:thenews/ApiClass/apicall.dart';
// import 'package:thenews/ApiClass/apicall.dart';
import 'package:thenews/AppBody/futureBuilder.dart';
// import 'package:thenews/AppBody/loading.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // routes: {
      //   '/': (context) => Loading(),
      // },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.person,
              color: Colors.black87,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "Latest News",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: NewsBody(),
    );
  }
}
