import 'package:ecommerce/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/card1.dart';
import '../components/list_tile.dart';
import '../utils/color.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  //pagecontroller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            //appbar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/icons/kodevin.jpg'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            //cards
            Container(
              height: 195,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  Card1(
                      balance: '340,020',
                      cardNumber: 62895638452,
                      expiryMonth: 10,
                      expiryYear: 23,
                      holderName: 'Kevin',
                      cardChipPath: 'assets/icons/chip.png',
                      color: AppColors.card1Color,
                      bank: 'Gt Bank'),
                  Card1(
                      balance: '923,038.23',
                      cardNumber: 823020120,
                      expiryMonth: 33,
                      expiryYear: 12,
                      holderName: 'Grant',
                      cardChipPath: 'assets/icons/chip.png',
                      color: AppColors.card2Color,
                      bank: 'Gt Bank'),
                  Card1(
                      balance: '340,003.20',
                      cardNumber: 5000000,
                      expiryMonth: 10,
                      expiryYear: 23,
                      holderName: 'Kevin',
                      cardChipPath: 'assets/icons/chip.png',
                      color: AppColors.card3Color,
                      bank: 'Gt Bank'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                spacing: 8.0,
                dotWidth: 10,
                dotHeight: 10,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: AppColors.dotColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //3 buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //send button
                Buttons(
                    iconImagePath: 'assets/icons/send.png',
                    buttonText: 'Send Money'),
                Buttons(
                    iconImagePath: 'assets/icons/wallet.png',
                    buttonText: 'Buy Data'),
                Buttons(
                    iconImagePath: 'assets/icons/headset-.png',
                    buttonText: 'Contact'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  //statistics
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(80)),
                    child: const MyListTile(
                      iconImagePath: 'assets/icons/bar-chart.png',
                      tileTitle: 'Transaction History',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: const MyListTile(
                        iconImagePath: 'assets/icons/credit-card.png',
                        tileTitle: 'Score Card'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
