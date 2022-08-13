import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/providers/gallery.dart';
import 'package:tour_360/providers/place.dart';
import 'package:tour_360/screens/bottom_nav.dart';
import 'package:tour_360/screens/entry_screen.dart';
import 'package:tour_360/screens/gallery_tour.dart';
import 'package:tour_360/screens/place_detail.dart';
import 'package:tour_360/screens/place_tour.dart';

import 'constants/constants.dart';

void main() => runApp(const TourApp());

class TourApp extends StatelessWidget {
  const TourApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaceData(),
        ),
        ChangeNotifierProvider(
          create: (context) => GalleryData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: accentColor,
            ),
          ),
          buttonTheme: ButtonThemeData(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            buttonColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const EntryScreen(),
        routes: {
          BottomNav.routeName: (context) => const BottomNav(),
          PlaceDetails.routeName: (context) => const PlaceDetails(),
          GalleryTour.routeName: (context)=>const GalleryTour(),
          PlaceTour.routeName: (context)=>const PlaceTour(),
        },
      ),
    );
  }
}
