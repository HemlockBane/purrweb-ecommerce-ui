import 'package:constraints_tutorial/models/item.dart';
import 'package:constraints_tutorial/widgets/pill_tab.dart';
import 'package:constraints_tutorial/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: widget.heroTag,
              child: Container(
                // height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.item.imagePath),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: Icon(
                              CupertinoIcons.cart_fill,
                              size: 30,
                              color: Colors.black,
                            ),
                            onPressed: () {},
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
                )
              ],
            ),
          ),
          DetailsBottomSheet()
        ],
      ),
    );
  }
}

class DetailsBottomSheet extends StatefulWidget {
  @override
  _DetailsBottomSheetState createState() => _DetailsBottomSheetState();
}

class _DetailsBottomSheetState extends State<DetailsBottomSheet> {
  final tabItems = ["Details", "Order", "Payment"];
  final sizes = ["S", "M", "L", "XL"];
  final colors = [Colors.black, Colors.red, Colors.blue, Colors.grey];
  final loremIpsum =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";

  var selectedTabIdx = 0;
  var selectedSizeIdx = 0;
  var selectedColorIdx = 0;

  var initialSheetSize = 0.35;
  var bottomSheetExtent = 0.0;
  var bottomSheetHeight = 0.0;
  var fabYPosition = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        fabYPosition = initialSheetSize * context.size.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          bottom: fabYPosition + 10,
          child: InkWell(
            splashColor: Colors.amber,
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.8),
              ),
              child: IconButton(
                icon: Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (DraggableScrollableNotification notification) {
            setState(() {
              bottomSheetExtent = notification.extent;
              bottomSheetHeight = context.size.height;
              fabYPosition = bottomSheetHeight * bottomSheetExtent;
            });

            return;
          },
          child: DraggableScrollableSheet(
              initialChildSize: initialSheetSize,
              minChildSize: 0.35,
              maxChildSize: 0.68,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        offset:
                                                            Offset(1.0, 3.0),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0)
                                                  ],
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
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
                                    for (var idx = 0;
                                        idx < colors.length;
                                        idx++) ...[
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColorIdx = idx;
                                          });
                                        },
                                        child: Container(
                                          height: 27,
                                          width: 27,
                                          padding: EdgeInsets.all(2.0),
                                          decoration: idx == selectedColorIdx
                                              ? BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: colors[idx]),
                                                )
                                              : null,
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              color: colors[idx],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (idx != colors.length - 1)
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
                                for (var idx = 0;
                                    idx < tabItems.length;
                                    idx++) ...[
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  "Country",
                                  style: textStyle(context,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
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
        ),
      ],
    );
  }
}
