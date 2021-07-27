import 'package:flutter/material.dart';
import 'package:thenews/ApiClass/apicall.dart';
import 'package:thenews/AppBody/customListTile.dart';
import 'package:thenews/AppBody/loading.dart';
import 'package:thenews/models/models.dart';


class NewsBody extends StatefulWidget {
  @override
  _NewsBodyState createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  final mynews = ApiCallClass();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black12,
      body: FutureBuilder(
        future: mynews.getNews(),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data;
            return ListView.builder(
              itemCount: snap.length,
              itemBuilder: (context, index) =>
                  customListTile(snapshot.data[index], context),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              snapshot.error,
            ));
          }
          return Loading();
        },
      ),
    );
  }
}
