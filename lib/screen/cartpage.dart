import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void payButtonPressed (BuildContext context){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          content: Text("User wants to pay! Connect this app to your paymwent backend"),
        ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("your cart is empty"))
                :ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context,index){
            final item = cart[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => removeItemFromCart(context,item),
              ),
            );
          }),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: ()=> payButtonPressed(context), child: Text("Pay Now")),
          )
        ],
      ),
    );
  }

 void removeItemFromCart(BuildContext context, Products products) {
   showDialog(context: context,
     builder: (context) =>
         AlertDialog(
           content: Text("Add this item to cart?"),
           actions: [
             MaterialButton(
               onPressed: () => Navigator.pop(context),
               child: Text("Cancel"),
             ),
             MaterialButton(
               onPressed: () {
                 Navigator.pop(context);
                 context.read<Shop>().removeFromCart(products);
               },
               child: Text("yes"),
             ),
           ],
         ),
   );
 }
}
