import 'package:constraints_tutorial/widgets/theme.dart';
import 'package:constraints_tutorial/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      // home: MyHomePage(),
      home: BottomSheetExperiment2(),
    );
  }
}

class BottomSheetExperiment2 extends StatefulWidget {
  @override
  _BottomSheetExperiment2State createState() => _BottomSheetExperiment2State();
}

class _BottomSheetExperiment2State extends State<BottomSheetExperiment2> {
  final tabItems = ["Details", "Order", "Payment"];
  final sizes = ["S", "M", "L", "XL"];
  final colors = [Colors.black, Colors.red, Colors.blue, Colors.grey];
  final loremIpsum =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  var selectedTabIdx = 0;
  var selectedSizeIdx = 0;
  var selectedColorIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.35,
          maxChildSize: 0.68,
          builder: (BuildContext context, ScrollController scrollController) {
            return Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(35))),
              elevation: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Stack(
                  children: [
                    ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Winter Coat',
                                    style: textStyle(context,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    '\$80',
                                    style: textStyle(context,
                                        color: Colors.grey, fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Text(
                                    'Your size',
                                    style: textStyle(context,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Row(
                                    children: [
                                      for (var idx = 0;
                                          idx < sizes.length;
                                          idx++) ...[
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSizeIdx = idx;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: idx == selectedSizeIdx
                                                  ? AppTheme.pink
                                                  : Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(1.0, 3.0),
                                                    blurRadius: 5.0,
                                                    spreadRadius: 1.0)
                                              ],
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(sizes[idx]),
                                          ),
                                        ),
                                        if (idx != sizes.length - 1)
                                          SizedBox(
                                            width: 10,
                                          )
                                      ]
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                for (var color in colors) ...[
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                  ),
                                  if (color != colors[colors.length - 1])
                                    SizedBox(
                                      height: 10,
                                    )
                                ]
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          children: [
                            for (var idx = 0; idx < tabItems.length; idx++) ...[
                              Container(
                                child: Expanded(
                                  child: PillTab(
                                    context: context,
                                    text: tabItems[idx],
                                    selectedTabIdx: selectedTabIdx,
                                    idx: idx,
                                    unselectedColor:
                                        Colors.grey.withOpacity(0.2),
                                    onTap: (int newIdx) {
                                      setState(() {
                                        selectedTabIdx = newIdx;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              if (idx != tabItems.length - 1)
                                SizedBox(
                                  width: 12,
                                )
                            ]
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Composition",
                              style: textStyle(context,
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              "Country",
                              style: textStyle(context,
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "100% polyester",
                              style: textStyle(context,
                                  fontSize: 15, color: AppTheme.grey),
                            ),
                            Text(
                              "Poland",
                              style: textStyle(context,
                                  fontSize: 15, color: AppTheme.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Care',
                          style: textStyle(context,
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          loremIpsum,
                          style: textStyle(context,
                              color: AppTheme.grey, fontSize: 15),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text(
                              "Add to cart",
                              style: textStyle(context,
                                  fontSize: 17, color: Colors.white),
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 19)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class BottomSheetExperiment extends StatefulWidget {
  @override
  _BottomSheetExperimentState createState() => _BottomSheetExperimentState();
}

class _BottomSheetExperimentState extends State<BottomSheetExperiment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: ElevatedButton(
          child: const Text('showModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              // isScrollControlled: true,
              // isDismissible: false,
              // enableDrag: true,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      )),
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

class PillTab extends StatelessWidget {
  const PillTab(
      {Key key,
      @required this.context,
      @required this.text,
      @required this.selectedTabIdx,
      @required this.idx,
      @required this.onTap,
      this.unselectedColor = Colors.transparent})
      : super(key: key);

  final BuildContext context;
  final String text;
  final int selectedTabIdx;
  final int idx;
  final Color unselectedColor;
  final Function(int p1) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(idx);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: selectedTabIdx == idx ? AppTheme.pink : unselectedColor,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
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
}

// The Scaffold widget gives loose constraints to its children
// Given these constraints, each child will size itself based on its

// own unique sizing algorithm

// To force the child of a Scaffold to fit the screen, give it tight constraints (e.g. use SizedBox.expand())

class ProductDetailScreen extends StatefulWidget {
  final Item item;
  final String heroTag;
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();

  ProductDetailScreen({this.item, this.heroTag});
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: widget.heroTag,
          child: Container(
            // height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.item.imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
