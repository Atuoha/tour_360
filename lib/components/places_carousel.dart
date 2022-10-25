import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_place.dart';
import '../providers/place.dart';
import '../screens/place_detail.dart';

class PlacesCarousel extends StatelessWidget {
  const PlacesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Consumer<PlaceData>(
        builder: (context, data, child) => CarouselSlider.builder(
          options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            // enlargeCenterPage: true,
            height: 300,
            // padEnds: false
          ),
          itemCount: data.getPlaces().length,
          itemBuilder: (context, index, i) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              PlaceDetails.routeName,
              arguments: {'id': data.getPlaces()[index].id},
            ),
            child: SinglePlace(
              imgSrc: data.getPlaces()[index].displayImgSrc,
              location: data.getPlaces()[index].location,
              title: data.getPlaces()[index].title,
              id: data.getPlaces()[index].id,
            ),
          ),
        ),
      ),
    );
  }
}
