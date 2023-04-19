import 'package:ecommerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                // logo
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    color: Colors.white,
                    'assets/images/nike-logo-49334.png',
                    height: 240,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                //title
                const Text(
                  'Just Do it',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 17,
                ),

                //sub title
                Text(
                  'Brand new sneakers and custom kicks made with premium quality',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
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
    );
  }
}
