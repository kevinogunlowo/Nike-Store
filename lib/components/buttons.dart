import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String iconImagePath;
  final String buttonText;
  const Buttons(
      {super.key, required this.iconImagePath, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                //Icon
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 25,
                      )
                    ]),
                child: Center(
                  child: Image.asset(iconImagePath),
                ))),
        const SizedBox(
          height: 12,
        ),
        Text(buttonText,
            style: TextStyle(
              fontSize: 13,
            ))
      ],
    );
  }
}
