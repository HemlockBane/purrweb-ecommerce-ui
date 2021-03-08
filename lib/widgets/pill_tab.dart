import 'package:constraints_tutorial/models/item.dart';
import 'package:constraints_tutorial/widgets/theme.dart';
import 'package:flutter/material.dart';

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
