import 'package:flutter/material.dart';

import '../components/heading.dart';
import '../components/places_carousel.dart';
import '../components/searchbox.dart';
import '../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 10,
          ),
          child: Column(
            children: const [
              Center(
                child: Text(
                  'Let\'s Tour Now!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: accentColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SearchBox(),
              SizedBox(height: 20),
              Heading(
                title: 'Popular Places',
                routeName: '',
              )
            ],
          ),
        ),
        const PlacesCarousel(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
            const Heading(
              title: 'Top Gallery Shots',
              routeName: '',
            )
          ],),
        )

      ],
    );
  }
}
