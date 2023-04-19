import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Method to add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user that the shoe was successfully added
    showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              title: Text('Succesfully Added!'),
              content: Text('Check your Cart'),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          //message
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'YESTERDAY YOU SAID TOMORROW \n JUST DO IT',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(
            height: 14,
          ),

          //hot picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Most Viewed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 15),
          // List of Shoes for Sale
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                //get a shoe from a shop list
                Shoe shoe = value.getShoeList()[index];
                    
                //return to the shoe
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              }),
              
            ),
            
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          //   child: Divider(
          //     color: Colors.purple,
          //   ),
          // )
        ],
        
      ),
      
    );
  }
}
