import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabchange;
  MyBottomNavBar({super.key, required this.onTabchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        //padding: EdgeInsets.symmetric(vertical: 20, ),
        child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
         // mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 15,
          onTabChange: (value) => onTabchange!(value),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          rippleColor: Colors.grey.shade800,
          hoverColor: Colors.grey.shade700,
          gap: 4,
          iconSize: 22,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.card_giftcard,
              text: 'Card',
            ),
            GButton(
              icon: Icons.account_box_rounded,
              text: 'Account',
            )
          ],
        ),
      ),
    );
  }
}
