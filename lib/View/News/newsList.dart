import 'package:flutter/material.dart';
import 'package:newsapp/Core/API/api_management.dart';
import 'package:newsapp/Core/Sourcesresponse/NewsResponse.dart';
import 'package:newsapp/Core/Sourcesresponse/Source.dart';
import 'package:newsapp/View/News/NewsItems/newsItems.dart';

class newsList extends StatelessWidget {
  Sources sources;

  newsList(this.sources);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<NewsResponse>(
            future: ApiManagement.getNews(sources.id ?? ''),
            builder: (buildContext, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Text("Error Loading data ${snapshot.error.toString()}");
              }
              if (snapshot.data?.status == "error") {
                return Center(
                  child: Text("ServerErrors${snapshot.data?.message}"),
                );
              }
              var newsList = snapshot.data?.articles;
              return ListView.builder(
                itemBuilder: (_, index) {
                  return NewsItems(newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
            }));
  }
}
