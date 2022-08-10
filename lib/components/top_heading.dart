import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TopHeading extends StatelessWidget {
  const TopHeading({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
          color: accentColor,
        ),
      ),
    );
  }
}
