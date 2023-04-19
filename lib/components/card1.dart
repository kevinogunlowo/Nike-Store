import 'package:flutter/material.dart';

import '../utils/color.dart';

class Card1 extends StatelessWidget {
  final String balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final String holderName;
  final String cardChipPath;
  final String bank;
  final color;
  
  Card1(
      {super.key,
      required this.balance,
      required this.cardNumber,
      required this.expiryMonth,
      required this.expiryYear,
      required this.holderName,
      required this.cardChipPath,
      required this.bank,
      this.color,
      
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: 300,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 20),
            Text(
              bank.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\₦' + balance.toString(),
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/icons/chip.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //card number
                Text(
                  cardNumber.toString(),
                  style: TextStyle(color: AppColors.textColor),
                ),

                //card expiry number
                Text(
                  expiryMonth.toString() + '/' + expiryYear.toString(),
                  style: TextStyle(color: AppColors.textColor),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              holderName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ));
  }
}
