import 'package:constraints_tutorial/widgets/theme.dart';
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
  Item({this.name, this.price, this.discount, this.imagePaths});

  String name = "";
  int price = 0;
  int discount = 0;
  List<String> imagePaths = [];
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
        name: "Winter Coat",
        price: 80,
        discount: 0,
        imagePaths: [AppImages.dami, AppImages.dami, AppImages.dami]),
    Item(name: "Woolen Coat", price: 80, discount: 30, imagePaths: [
      AppImages.eliDafaria,
      AppImages.eliDafaria,
      AppImages.eliDafaria
    ]),
    Item(
        name: "Winter Coat",
        price: 80,
        discount: 0,
        imagePaths: [AppImages.dami, AppImages.dami, AppImages.dami]),
    Item(name: "Woolen Coat", price: 80, discount: 30, imagePaths: [
      AppImages.eliDafaria,
      AppImages.eliDafaria,
      AppImages.eliDafaria
    ])
  ];
}

List<Item> getRecommendedPlaceHolderItems() {
  return <Item>[
    Item(name: "", price: 80, discount: 0, imagePaths: [
      AppImages.markAdriano,
      AppImages.markAdriano,
      AppImages.markAdriano
    ]),
    Item(name: "", price: 80, discount: 30, imagePaths: [
      AppImages.tamaraBellis,
      AppImages.tamaraBellis,
      AppImages.tamaraBellis
    ]),
    Item(name: "", price: 80, discount: 0, imagePaths: [
      AppImages.markAdriano,
      AppImages.markAdriano,
      AppImages.markAdriano
    ]),
    Item(name: "", price: 80, discount: 30, imagePaths: [
      AppImages.tamaraBellis,
      AppImages.tamaraBellis,
      AppImages.tamaraBellis
    ])
  ];
}
