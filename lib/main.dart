import 'package:ecommerceapp/models/shop.dart';
import 'package:ecommerceapp/screen/cartpage.dart';
import 'package:ecommerceapp/screen/intro.dart';
import 'package:ecommerceapp/screen/shopPage.dart';
import 'package:ecommerceapp/utils/mycolor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(create: (context)=> Shop(),
      child: const MyApp(),
      ),
      );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page':(context)=> const IntroPage(),
        '/shop_page':(context)=> const ShopPage(),
        '/cart_page':(context)=> const CartPage(),
      },
    );
  }
}
