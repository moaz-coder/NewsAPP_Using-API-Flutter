import 'package:flutter/material.dart';

class Gridveiwcategeroay extends StatelessWidget {
  Category category;
  int index;
  Function OnclickItem;

  Gridveiwcategeroay(
      {required this.category, required this.index, required this.OnclickItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        OnclickItem(category);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: category.CategoryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.CategoryImage),
            Text(
              category.CategoryTittle,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  String CategoryId;
  String CategoryTittle;
  String CategoryImage;
  Color CategoryBackground;

  Category(
      {required this.CategoryId,
      required this.CategoryImage,
      required this.CategoryTittle,
      required this.CategoryBackground});
}
