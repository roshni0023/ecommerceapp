
import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Products products;
  const MyProductTile({super.key,required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           children: [
             AspectRatio(
               aspectRatio: 1,
               child: Container(
                   decoration: BoxDecoration(
                     color: Theme.of(context).colorScheme.secondary,
                   ),
                   width: double.infinity,
                   padding: const EdgeInsets.all(25),
                   child: Image.asset(products.imagePath),
             ),
             ),
             const SizedBox(height:20),
             Text(
               products.name,
               style: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20),
             ),
             const SizedBox(height: 10),
             Text(products.description,
               style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
               ),
             ),
           ],
         ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+products.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),),
              )
            ],
          ),
        ],
      ),
    );
  }
  void addToCart(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("Add this item to cart?"),
      actions: [
        MaterialButton(onPressed: ()=> Navigator.pop(context),
        child: Text("Cancel"),
        ),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
          context.read<Shop>().addToCart(products);
    },
          child: Text("yes"),
        ),
      ],
    ),
    );
  }
}
