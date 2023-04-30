import 'package:ecommerce/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/sign_up_button.dart';
import '../components/textfield.dart';
import '../services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //SIGN UP USER METHOD
  void signUserUp() async {
    print('Senior dev Sign Up Here');
    //show loading circle after entering username and password
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //TRY TO SIGN UP A USER
    try {
      //CHECK IF PASSWORD IS CONFIRMED
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //SHOW ERROR MESSAGE, PASSWORDS DONT MATCH
        showErrorMessage('Passwords dont match!');
      }
      //POP THE LOADING CIRCLE
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //POP THE LOADING CIRCLE
      Navigator.pop(context);
      //SHOW ERROR MESSAGE
      showErrorMessage(e.code);
    }
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orange,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 216, 216),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                //LOGO BEING DISPLAYED
                const Icon(
                  Icons.podcasts,
                  size: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                //SIGN UP WITH EASE
                Text(
                  'Sign Up for Free',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 19,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //EMAIL TEXTFIELD
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 13,
                ),
                //PASSWORD TEXTFIELD
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 13,
                ),
                //CONFIRM PASSWORD TEXTFIELD
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                //SIGN UP BUTTON
                SignUpButton(
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 15,
                ),
                //OR CONTINUE WITH
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
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
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
                  height: 15,
                ),
                //GOGGLE & APPLE SIGN IN BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //GOGGLE BUTTON
                    SquareTile(
                      imagePath: 'assets/images/google.png',
                      onTap: () => AuthService().signInWithGoogle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //APPLE BUTTON
                    SquareTile(
                      onTap: () {},
                      imagePath: 'assets/images/apple.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //NOT A MEMBER REGISTER NOW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
