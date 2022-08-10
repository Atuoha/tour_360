import 'package:flutter/material.dart';

import '../components/heading.dart';
import '../components/searchbox.dart';
import '../components/top_heading.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: const [
          TopHeading(title: 'Tour with us Now!'),
          SizedBox(height: 10),
          SearchBox(),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}
