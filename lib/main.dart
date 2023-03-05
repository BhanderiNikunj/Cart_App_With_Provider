import 'package:cart_app_with_provider/Screens/HomePage/Provider/HomeProvider.dart';
import 'package:cart_app_with_provider/Screens/HomePage/View/CartDetailPage.dart';
import 'package:cart_app_with_provider/Screens/HomePage/View/DetailPage.dart';
import 'package:cart_app_with_provider/Screens/HomePage/View/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home(),
          'detail':(context) => Detail(),
          'cart':(context) => Cart(),
        },
      ),
    ),
  );
}
