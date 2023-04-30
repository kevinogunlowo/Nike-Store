import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginConfirmationPage extends StatefulWidget {
  LoginConfirmationPage({super.key});

  @override
  State<LoginConfirmationPage> createState() => _LoginConfirmationPageState();
}

class _LoginConfirmationPageState extends State<LoginConfirmationPage> {
  final user = FirebaseAuth.instance.currentUser!;

//sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Text(
            "LOGGED IN AS: ${user.email}",
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
