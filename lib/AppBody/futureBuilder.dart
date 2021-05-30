import 'package:flutter/material.dart';
import 'package:thenews/ApiClass/apicall.dart';
import 'package:thenews/AppBody/customListTile.dart';
import 'package:thenews/models/models.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsBody extends StatefulWidget {
  @override
  _NewsBodyState createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  final mynews = ApiCallClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: mynews.getNews(),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) => customListTile(
                snapshot.data[index],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Can't Fetch News !");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
