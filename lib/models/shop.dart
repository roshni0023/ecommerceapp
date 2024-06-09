import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/foundation.dart';

class Shop extends ChangeNotifier{
final List<Products> _shop =[
  Products(
      name: "Products 1",
      price: 99.99,
      imagePath: "assets/image/tv.png",
      description: "Item description.."),
  Products(
      name: "Products 2", price: 99.99, imagePath: "assets/image/iphone.png", description: "Item description.."),
  Products(name: "Products 3", price: 99.99, imagePath: "assets/image/lap.png", description: "Item description.."),
];
List<Products> _cart = [];
List<Products> get shop => _shop;
List<Products> get cart => _cart;
 void addToCart(Products item) {
   _cart.add(item);
   notifyListeners();

 }
 void removeFromCart(Products item){
   _cart.remove(item);
   notifyListeners();
 }
}