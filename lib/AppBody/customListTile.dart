import 'package:flutter/material.dart';
import 'package:thenews/AppBody/newspage.dart';
import 'package:thenews/models/models.dart';
// import 'package:thenews/ApiClass/apicall.dart';
// import 'package:url_launcher/url_launcher.dart';

Widget customListTile(Article article, context) {
  return Container(
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.blueGrey[200],
          blurRadius: 7,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey[600],
                blurRadius: 7,
                spreadRadius: 5,
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  article.urlToImage == null ? "" : article.urlToImage),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blueGrey[600],
              borderRadius: BorderRadius.circular(
                30,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 1,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 7,
                          spreadRadius: 3,
                        ),
                      ]),
                  child: Text(
                    article.source.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsPage(
                          article: article,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.amber,
                  ),
                  label: Text(
                    "Read News",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          article.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
