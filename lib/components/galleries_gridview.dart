import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_gallery_grid.dart';
import 'package:tour_360/providers/gallery.dart';

import '../screens/gallery_tour.dart';

class GalleriesGridView extends StatelessWidget {
  const GalleriesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    var galleryData = Provider.of<GalleryData>(
      context,
      listen: false,
    ).getGalleries();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        mainAxisSpacing: 10,
      ),
      itemCount: galleryData.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          GalleryTour.routeName,
          arguments: {
            'id': galleryData[index].id,
          },
        ),
        child: SingleGalleryGrid(
          imgSrc: galleryData[index].displayImgSrc,
          location: galleryData[index].location,
          title: galleryData[index].title,
          id: galleryData[index].id,
        ),
      ),
    );
  }
}
