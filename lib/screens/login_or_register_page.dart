import 'package:ecommerce/screens/register_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page at the beginng
  bool showLoginPage = true;
  //method to toggle beetween login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap:togglePages ,
      );
    } else {
      return RegisterPage(
        onTap:togglePages,
      );
    }
  }
}
