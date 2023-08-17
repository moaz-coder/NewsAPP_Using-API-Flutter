import 'package:flutter/material.dart';
import 'package:newsapp/Core/API/api_management.dart';
import 'package:newsapp/Core/Sourcesresponse/SourcesResponse.dart';
import 'package:newsapp/View/CategoryListVeiw/Categeroy_Item_Widght.dart';
import 'package:newsapp/View/GridVeiwCategeroay/GridVeiwCategeroay.dart';

class CategoryListVeiw extends StatelessWidget {
  Category category;

  CategoryListVeiw(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManagement.getSources(category.CategoryId),
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
          var sources = snapshot.data?.sources;
          return CategoryTapsItems(sources!);
        },
      ),
    );
  }
}
