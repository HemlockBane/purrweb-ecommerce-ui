import 'file:///C:/Users/igwen/Code%20Projects/IdeaProjects/constraints_tutorial/lib/widgets/theme.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: DefaultTabController(
            length: 4,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                children: [
                  buildAppBar(),
                  Flexible(
                    child: FractionallySizedBox(
                      heightFactor: 0.08,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 11, horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                          ),
                          child: Text('Coats'),
                        ),
                      )
                    ],
                  ),
                  TabBar(
                    tabs: [
                      Tab(text: 'Coats'),
                      Tab(text: 'Dresses'),
                      Tab(text: 'Jerseys'),
                      Tab(text: 'Pants')
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Tab(text: 'Popular'),
                        Tab(text: 'A-Z'),
                        Tab(text: 'Last viewed'),
                        Tab(text: 'Last viewed')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ), //
    );
  }

  // Widget _tab(){
  //   return SingleChildScrollView(
  //     child: ,
  //   );
  // }

  Row buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black),
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
                  size: 35,
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
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text('2'),
              ),
            )
          ],
        )
      ],
    );
  }
}

// The Scaffold widget gives loose constraints to its children
// Given these constraints, each child will size itself based on its
// own unique sizing algorithm

// To force the child of a Scaffold to fit the screen, give it tight constraints (e.g. use SizedBox.expand())
