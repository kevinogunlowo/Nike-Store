import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final Function()? onTap;
  const SignUpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        child: const Center(
            child: Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}
