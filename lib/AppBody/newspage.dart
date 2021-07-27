import 'package:flutter/material.dart';
import 'package:thenews/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final Article article;

  NewsPage({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          }, color: Colors.black54,icon: Icon(Icons.arrow_back,),),
        ),
        title: Text(article.title == null ? '' : article.title, style: TextStyle(color: Colors.black54),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[600],
                    blurRadius: 7,
                    spreadRadius: 5,
                  ),
                ],
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage == null
                      ? "No Image"
                      : article.urlToImage),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[400],
                    blurRadius: 7,
                    spreadRadius: 5,
                  ),
                ],
              ),
              width: double.infinity,
              child: Text(
                article.content == null ? "" : article.content,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                await canLaunch(article.url)
                    ? launch(article.url)
                    : throw "can't launch ${article.url}";
              },
              icon: Icon(
                Icons.launch,
                color: Colors.black54,
                size: 30,
              ),
              label: Text(
                "Read Full News",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget listTile(Article article) {
//   return
// }
