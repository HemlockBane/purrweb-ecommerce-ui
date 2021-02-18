import 'package:constraints_tutorial/widgets/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getDefaultAppTheme() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          labelStyle: baseTheme.textTheme.bodyText1.copyWith(),
          indicator: BubbleTabIndicator(
            // indicatorColor: Colors.green,
            indicatorHeight: 13,
            indicatorRadius: 15,
            tabBarIndicatorSize: TabBarIndicatorSize.label,
          ),
          indicatorSize: TabBarIndicatorSize.label),
    );
  }
}
