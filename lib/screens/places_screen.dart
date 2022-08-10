import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/places_gridview.dart';
import '../components/searchbox.dart';
import '../components/top_heading.dart';
import '../providers/place.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const TopHeading(title: 'Tour with us Now!'),
          const SizedBox(height: 10),
          const SearchBox(),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<PlaceData>(
              builder: (context, data, child) => data.getPlaces().isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/oops.png'),
                          const SizedBox(height: 20),
                          const Text(
                            'Ops! It\'s empty',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  : PlacesGridView(
                      places: data.getPlaces(),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
