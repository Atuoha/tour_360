import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_place.dart';
import '../providers/place.dart';

class PlacesCarousel extends StatelessWidget {
  const PlacesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var places = Provider.of<PlaceData>(context, listen: false).getPlaces();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: CarouselSlider.builder(
        itemCount: places.length,
        itemBuilder: (context, index, i) => GestureDetector(
          onTap: () => null, // Navigate to individual screen using id
          child: SinglePlace(
            imgSrc: places[index].displayImgSrc,
            location: places[index].location,
            title: places[index].title,
            id: places[index].id,
          ),
        ),
        options: CarouselOptions(
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlay: true,
          // enlargeCenterPage: true,
          height: 280,
          // padEnds: false
        ),
      ),
    );
  }
}

