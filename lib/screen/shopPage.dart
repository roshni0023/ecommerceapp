import 'package:ecommerceapp/widgets/product%20tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';
import '../widgets/drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("shop Page"),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context,'/cart_page'), icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
     body: ListView(
       children: [
         Center(
     child: Text("SHOP",
       style: TextStyle(
         color: Theme.of(context).colorScheme.inversePrimary),
       ),
     ),
       SizedBox(
       height: 550,
       child: ListView.builder(
           itemCount: products.length,
           scrollDirection: Axis.horizontal,
           padding: const EdgeInsets.all(15),
           itemBuilder: (context, index) {
             final product = products[index];
             return MyProductTile(products: product);
           }),
       ),
       ],
      ),
    );
  }
}
