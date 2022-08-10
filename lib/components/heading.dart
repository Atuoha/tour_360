import 'package:flutter/material.dart';
import '../constants/constants.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key, required this.title, required this.routeName})
      : super(key: key);
  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            color: accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(routeName),
          child: const Text(
            'See all',
            style: TextStyle(
              color: primaryColor,

            ),
          ),
        )
      ],
    );
  }
}
