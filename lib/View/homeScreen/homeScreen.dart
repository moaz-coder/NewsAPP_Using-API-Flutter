import 'package:flutter/material.dart';
import 'package:newsapp/View/CategoryListVeiw/CategoryListVeiw.dart';
import 'package:newsapp/View/GridVeiwCategeroay/GridVeiwCategeroay.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> category = [
    Category(
      CategoryId: "sports",
      CategoryImage: ("assets/images/sports.png"),
      CategoryTittle: "Sports",
      CategoryBackground: Color.fromARGB(255, 201, 28, 34),
    ),
    Category(
      CategoryId: "general",
      CategoryImage: ("assets/images/politics.png"),
      CategoryTittle: "General",
      CategoryBackground: Color(0xFF003E90),
    ),
    Category(
      CategoryId: "health",
      CategoryImage: ("assets/images/health.png"),
      CategoryTittle: "Health",
      CategoryBackground: Color(0xFFED1E79),
    ),
    Category(
      CategoryId: "business",
      CategoryImage: ("assets/images/bussines.png"),
      CategoryTittle: "Business",
      CategoryBackground: Color(0xFFCF7E48),
    ),
    Category(
      CategoryId: "technology",
      CategoryImage: ("assets/images/environment.png"),
      CategoryTittle: "Technology",
      CategoryBackground: Color(0xFF4882CF),
    ),
    Category(
      CategoryId: "science",
      CategoryImage: ("assets/images/science.png"),
      CategoryTittle: "Science",
      CategoryBackground: Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          selecteditem == null ? "News APP" : selecteditem!.CategoryTittle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22))),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 48),
              width: double.infinity,
              height: 120,
              color: Colors.green,
              child: Text("News App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selecteditem = null;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Categeory",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: selecteditem == null
          ? Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Pick your category \n of interest",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 6 / 7),
                      itemBuilder: (context, index) => Gridveiwcategeroay(
                        category: category[index],
                        OnclickItem: onclick,
                        index: index,
                      ),
                      itemCount: category.length,
                    ),
                  ),
                ],
              ),
            )
          : CategoryListVeiw(selecteditem!),
    );
  }

  Category? selecteditem = null;

  void onclick(Category category) {
    setState(() {
      selecteditem = category;
    });
  }
}
