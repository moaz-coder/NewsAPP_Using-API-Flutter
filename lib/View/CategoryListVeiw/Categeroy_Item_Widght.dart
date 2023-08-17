import 'package:flutter/material.dart';
import 'package:newsapp/Core/Sourcesresponse/Source.dart';
import 'package:newsapp/View/CategoryListVeiw/Category_Tap_Items.dart';
import 'package:newsapp/View/News/newsList.dart';

class CategoryTapsItems extends StatefulWidget {
  List<Sources> sources;

  CategoryTapsItems(this.sources);

  @override
  State<CategoryTapsItems> createState() => _CategoryTapsItemsState();
}

class _CategoryTapsItemsState extends State<CategoryTapsItems> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((item) => SourceTab(
                      item, widget.sources.indexOf(item) == selectedIndex))
                  .toList(),
              isScrollable: true,
            ),
            Expanded(child: newsList(widget.sources[selectedIndex]))
          ],
        ),
      ),
    );
  }
}
