import 'package:flutter/material.dart';
import 'package:thenews/models/models.dart';
// import 'package:thenews/ApiClass/apicall.dart';
import 'package:url_launcher/url_launcher.dart';

Widget customListTile(Article article) {
  return Container(
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
        )
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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  article.urlToImage == null ? "" : article.urlToImage),
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(3),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  article.source.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.launch,
                    size: 30,
                  ),
                  onPressed: () async {
                    await canLaunch(article.url)
                        ? launch(article.url)
                        : throw "can't launch ${article.url}";
                  }),
            ],
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
