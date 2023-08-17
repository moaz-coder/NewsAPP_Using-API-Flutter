import 'package:flutter/material.dart';
import 'package:newsapp/Core/Sourcesresponse/NewsResponse.dart';

class NewsItems extends StatelessWidget {
  Articles news;

  NewsItems(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            child: Image.network(
              news.urlToImage ?? "",
              height: 200,
              width: double.infinity,
            ),
          ),
          Text(
            news.author ?? "",
            textAlign: TextAlign.start,
          ),
          Text(
            news.title ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            news.publishedAt ?? "",
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
