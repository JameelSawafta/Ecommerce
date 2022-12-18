import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'images/ThankGodBowl.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Thank God Bowl',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF272833),

            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            '\$ 1750',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF272833),
            ),
          ),
        ],
      ),
    );
  }
}
