import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

import '../components/shoe_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
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
        // const Padding(
        //   padding: EdgeInsets.symmetric(vertical: 25.0),
        //   child: Text(
        //     'YESTERDAY YOU SAID TOMORROW JUST DO IT',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(color: Colors.grey),
        //   ),
        // ),

        const SizedBox(
          height: 20,
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

        const SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              //create a shoe
              Shoe shoe = Shoe(
                  name: 'Air MAx',
                  price: 500,
                  imagePath:
                      'assets/images/luis-felipe-lins-J2-wAQDckus-unsplash.jpg',
                  description: 'Fly shoe');
              return ShoeTile(shoe: shoe);
            }), 
          ),
        )
      ],
    );
  }
}
