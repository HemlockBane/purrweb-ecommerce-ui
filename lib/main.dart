import 'package:constraints_tutorial/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle textStyle(BuildContext context,
    {Color color = AppTheme.black,
    double fontSize = 17.0,
    FontWeight fontWeight = FontWeight.normal}) {
  return Theme.of(context).textTheme.bodyText1.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}

class Item {
  Item({this.name, this.price, this.discount, this.imagePath});

  String name = "";
  int price = 0;
  int discount = 0;
  String imagePath = "";
}

class AppImages {
  static String _basePath = "assets/images";
  static String dami = "$_basePath/dami.jpg";
  static String eliDafaria = "$_basePath/eli_defaria.jpg";
  static String marionelLuciano = "$_basePath/marionel_luciano.jpg";
  static String markAdriano = "$_basePath/mark_adriano.jpg";
  static String tamaraBellis = "$_basePath/tamara_bellis.jpg";
}

List<Item> getPlaceHolderItems() {
  return <Item>[
    Item(
        name: "Winter Coat", price: 80, discount: 0, imagePath: AppImages.dami),
    Item(
        name: "Woolen Coat",
        price: 80,
        discount: 30,
        imagePath: AppImages.eliDafaria),
    Item(
        name: "Winter Coat", price: 80, discount: 0, imagePath: AppImages.dami),
    Item(
        name: "Woolen Coat",
        price: 80,
        discount: 30,
        imagePath: AppImages.eliDafaria)
  ];
}

List<Item> getRecommendedPlaceHolderItems() {
  return <Item>[
    Item(name: "", price: 80, discount: 0, imagePath: AppImages.markAdriano),
    Item(name: "", price: 80, discount: 30, imagePath: AppImages.tamaraBellis),
    Item(name: "", price: 80, discount: 0, imagePath: AppImages.markAdriano),
    Item(name: "", price: 80, discount: 30, imagePath: AppImages.tamaraBellis)
  ];
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purrweb Store',
      theme: AppTheme().getDefaultAppTheme(),
      // theme: ThemeData(
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabItems = ["Coats", "Dresses", "Jersey", "Pants"];
  var selectedTabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  children: [
                    buildAppBar(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          4, (int idx) => _buildTab(tabItems[idx], idx)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCatalog()
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.9),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ), //
    );
  }

  Row buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                  AppImages.marionelLuciano,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Stack(
          fit: StackFit.loose,
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
            ),
            Positioned(
              right: 10,
              top: -3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.pink,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '2',
                  style: textStyle(context,
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  InkWell _buildTab(String text, int idx) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedTabIdx = idx;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: selectedTabIdx != idx
            ? null
            : BoxDecoration(
                color: AppTheme.pink,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
        child: Text(
          text,
          style: textStyle(
            context,
            fontSize: 14.5,
            fontWeight:
                selectedTabIdx != idx ? FontWeight.normal : FontWeight.bold,
          ),
          // style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  Expanded _buildCatalog() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  4,
                  (int idx) {
                    final items = getPlaceHolderItems();
                    final item = items[idx];
                    return Container(
                      margin: EdgeInsets.only(right: 17),
                      height: 200,
                      width: 190,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(item.imagePath),
                                        fit: BoxFit.cover),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                  ),
                                ),
                                if (item.discount != 0)
                                  Positioned(
                                    top: 7,
                                    left: 10,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        '-${item.discount}%',
                                        style: textStyle(context,
                                            color: Colors.white, fontSize: 13),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${item.name}',
                                  style: textStyle(context,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.5),
                                ),
                                Text(
                                  "\$${item.price}",
                                  style: textStyle(context,
                                      color: AppTheme.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.5),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              "Recommended for You",
              style: textStyle(
                context,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  4,
                  (int idx) => Container(
                    margin: EdgeInsets.only(right: 17),
                    height: 100,
                    width: 170,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _tab(){
  //   return SingleChildScrollView(
  //     child: ,
  //   );
  // }

}

// The Scaffold widget gives loose constraints to its children
// Given these constraints, each child will size itself based on its
// own unique sizing algorithm

// To force the child of a Scaffold to fit the screen, give it tight constraints (e.g. use SizedBox.expand())
