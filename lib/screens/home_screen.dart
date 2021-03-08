import 'package:constraints_tutorial/models/item.dart';
import 'package:constraints_tutorial/screens/product_detail_screen.dart';
import 'package:constraints_tutorial/widgets/pill_tab.dart';
import 'package:constraints_tutorial/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        4,
                        (int idx) => PillTab(
                            context: context,
                            text: tabItems[idx],
                            selectedTabIdx: selectedTabIdx,
                            idx: idx,
                            onTap: (int newIdx) {
                              setState(() {
                                selectedTabIdx = newIdx;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCatalog(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.9),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    size: 30,
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
                  CupertinoIcons.cart,
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

  Expanded _buildCatalog() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProducts(),
            _buildRecommendedItems(),
          ],
        ),
      ),
    );
  }

  Column _buildProducts() {
    return Column(
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
                            GestureDetector(
                              child: Hero(
                                tag: '${item.name}_$idx',
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(item.imagePath),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) {
                                    return ProductDetailScreen(
                                      item: item,
                                      heroTag: '${item.name}_$idx',
                                    );
                                  }),
                                );
                              },
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
                                  fontWeight: FontWeight.bold, fontSize: 14.5),
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
      ],
    );
  }

  Widget _buildRecommendedItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended for You",
          style: textStyle(
            context,
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
              (int idx) {
                final items = getRecommendedPlaceHolderItems();
                final item = items[idx];
                return Container(
                  margin: EdgeInsets.only(right: 17),
                  height: 100,
                  width: 155,
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Hero(
                            tag: "${item.name}_$idx",
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(item.imagePath),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) {
                                return ProductDetailScreen(
                                  item: item,
                                  heroTag: "${item.name}_$idx",
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
