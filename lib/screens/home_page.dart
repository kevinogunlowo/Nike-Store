import 'package:ecommerce/components/buttom_nav_bar.dart';
import 'package:ecommerce/screens/card_page.dart';
import 'package:ecommerce/screens/shop_page.dart';
import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  //this method will update our selected index

  //when the user taps on the bottom bar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Screens to be displayed
  final List<Widget> _pages = [
    //shop page
    const HomeScreen(),

    //cart page

    const CartScreen(),

    //card page

    const CardScreen(),

    //account page

    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabchange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: AppColors.paraColor,
                ));
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //logo
              DrawerHeader(
                child: Image.asset(
                  'assets/images/nike-logo-49334.png',
                  color: Colors.white,
                ),
              ),

              //the divider line underneath the logo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey[800],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.shopping_bag_rounded,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Shop',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.card_giftcard,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Card',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )

              //contact us
            ],
          ),
        ]),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
