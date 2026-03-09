import 'package:flutter/material.dart';
import 'food.dart';

class Cart extends ChangeNotifier {
//list of food for sale
  List<Food> foodFood = [
    Food(
        name: '  Pancake',
        price: ' 240',
        description: 'Have a nice feed',
        imagePath: 'lib/images/4.png'),
    Food(
        name: '  Platter',
        price: ' 300',
        description: 'Have a nice feed',
        imagePath: 'lib/images/3.png'),
    Food(
        name: '  Platter2',
        price: ' 350',
        description: 'Have a nice feed',
        imagePath: 'lib/images/2.png'),
    Food(
        name: '  Pancake',
        price: ' 240',
        description: 'Have a nice feed',
        imagePath: 'lib/images/4.png'),
    Food(
        name: '  Platter',
        price: ' 300',
        description: 'Have a nice feed',
        imagePath: 'lib/images/3.png'),
    Food(
        name: '  Platter2',
        price: ' 350',
        description: 'Have a nice feed',
        imagePath: 'lib/images/2.png'),
  ];
//list of item in user cart
  List<Food> userCart = [];
//get list of food for sale
  List<Food> getFoodList() {
    return foodFood;
  }

//get cart
  List<Food> getUserCart() {
    return userCart;
  }

//add item to cart
  void addItemToCart(Food food) {
    userCart.add(food);
    notifyListeners();
  }

//remove item to cart
  void removeItemFromCart(Food food) {
    userCart.remove(food);
    notifyListeners();
  }
}
