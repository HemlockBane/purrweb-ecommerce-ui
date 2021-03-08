import 'package:constraints_tutorial/screens/home_screen.dart';
import 'package:constraints_tutorial/screens/product_detail_screen.dart';
import 'package:constraints_tutorial/widgets/pill_tab.dart';
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
      home: HomeScreen(),
      // home: DetailsBottomSheet(),
    );
  }
}
