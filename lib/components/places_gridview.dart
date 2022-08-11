import 'package:flutter/material.dart';
import 'package:tour_360/components/single_place_grid.dart';
import '../models/place.dart';
import '../screens/place_detail.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({
    Key? key,
    required this.places,
  }) : super(key: key);
  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        mainAxisSpacing: 10,
      ),
      itemCount: places.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          PlaceDetails.routeName,
          arguments: {'id': places[index].id},
        ),
        child: SinglePlaceGrid(
          imgSrc: places[index].displayImgSrc,
          location: places[index].location,
          title: places[index].title,
          id: places[index].id,
        ),
      ),
    );
  }
}
