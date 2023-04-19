import 'package:ecommerce/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../components/sign_in_button.dart';
import '../components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

// text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

//sign-in user method
  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 216, 216),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //logo
              const Icon(
                Icons.shop,
                size: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              //welcome back, you've been missed
              Text(
                'Welcome we missed you',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 25),
              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'UserName',
                obscureText: false,
              ),

              const SizedBox(
                height: 13,
              ),
              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //sign in button
              SignInButton(
                onTap: signUserIn,
              ),
              const SizedBox(
                height: 25,
              ),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.red[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.red[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //goggle sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'assets/images/google.png'),

                  const SizedBox(
                    width: 20,
                  ),
                  //apple button

                  SquareTile(imagePath: 'assets/images/apple.png'),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //not a member register now
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member'),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
