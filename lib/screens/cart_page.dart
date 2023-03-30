import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  //get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];

                  //return the cart item
                  return CartItem(shoe: individualShoe);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
