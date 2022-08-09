import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/providers/area.dart';
import 'package:tour_360/providers/place.dart';
import 'package:tour_360/screens/entry_screen.dart';

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
          create: (context) => AreaData(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: EntryScreen(), routes: {}),
    );
  }
}
