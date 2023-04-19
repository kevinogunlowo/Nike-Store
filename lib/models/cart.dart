import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Air Max 270',
      price: '338',
      imagePath: 'assets/images/air max 270.jpg',
      description:
          'Soft and responsive cushioning provides luxurious comfort for everyday wear. ',
    ),
    Shoe(
        name: 'AirForce 1',
        price: '150',
        imagePath: 'assets/images/custom.jpg',
        description: 'Designed by Bruce Kilgore and introduced in 1982,'),
    Shoe(
      name: 'Air Max',
      price: '400',
      imagePath: 'assets/images/barczak.jpg',
      description:
          'Material Full leather uppers and a rubber midsole and outsole',
    ),
    Shoe(
      name: 'Air Jordan Low',
      price: '420',
      imagePath: 'assets/images/cool.jpg',
      description: 'Inspired by the original that debuted in 1985',
    ),
    Shoe(
        name: 'Travis Air',
        price: '420',
        imagePath: 'assets/images/malix.jpg',
        description:
            'Odddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddriginally designed for performance running,'),
    Shoe(
      name: 'Vans',
      price: '420',
      imagePath: 'assets/images/air max 270.jpg',
      description: '  pillars: action sports, music, art and street culture.',
    ),
    Shoe(
      name: 'Yeezy 350',
      price: '420',
      imagePath: 'assets/images/air max 270.jpg',
      description: 'The midsole utilizes adidas’ innovative BOOST™ technology.',
    ),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];
  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //method to add items to cart'
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners(); // used anytime the state is updated
  }

  //method to remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners(); // used anytime the state is updated
  }
}
