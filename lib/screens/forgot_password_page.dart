import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
       // ignore: use_build_context_synchronously
       showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                'Password Reset Link Sent!! Check Your Email',
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Enter Your Email and we will send you a password reset link',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15),
          //EMAIL TEXTFIELD
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _emailController,
              //obscureText: obscureText,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  hintText: 'Email',
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
          ),
          SizedBox(height: 15),
          MaterialButton(
            onPressed: passwordReset,
            child: Text('Reset Password'),
            color: Colors.amberAccent,
          )
        ],
      ),
    );
  }
}
