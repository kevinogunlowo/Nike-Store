import 'package:ecommerce/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  //SIGNED IN AS MESSAGE
  void showSignedInMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              "LOGGED IN AS: ${user.email}",
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        IconButton(
          onPressed: signUserOut,
          icon: const Icon(Icons.logout),
        ),
      ]),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.4, 0.6, 0.9],
                colors: [Colors.yellow, Colors.red, Colors.indigo, Colors.teal],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LOGO
                  Image.asset(
                    color: Colors.white,
                    'assets/images/nike-logo-49334.png',
                    height: 150,
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  //title
                  const Text(
                    'Just Do it',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //sub title
                  Text(
                    'Brand new sneakers and custom kicks made with premium quality',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  //start now button

                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Shop Now',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(fontSize: 15),
                              fontWeight: FontWeight.bold,
                              color: AppColors.buttonBackGroundColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
