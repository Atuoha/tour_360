import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_place.dart';
import 'package:tour_360/components/single_place_grid.dart';
import '../providers/place.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Consumer<PlaceData>(
      builder: (context, data, child) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        itemCount: data.getPlaces().length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => null, // Navigate to individual screen using id
          child: SinglePlaceGrid(
            imgSrc: data.getPlaces()[index].displayImgSrc,
            location: data.getPlaces()[index].location,
            title: data.getPlaces()[index].title,
            id: data.getPlaces()[index].id,
          ),
        ),
      ),
    );
  }
}
