import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          //Picture of Shoe
          ClipRect(
            // borderRadius: BorderRadius.circular(12),
            child: Image.asset(shoe.imagePath),
          )
          //Description

          //Price + Details

          //Button to add to cart
        ],
      ),
    );
  }
}
