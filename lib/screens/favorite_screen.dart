import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/places_gridview.dart';
import '../components/searchbox.dart';
import '../components/top_heading.dart';
import '../providers/place.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
              builder: (context, data, child) => data.getFavorites().isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Image.network('https://miro.medium.com/max/1260/1*hRJF5CNRG6tB-SkwVU5bCw.gif'),
                          const SizedBox(height: 20),
                          const Text(
                            'Ops! It\'s empty. Add to Favorites',
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
                      places: data.getFavorites(),
                    ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
