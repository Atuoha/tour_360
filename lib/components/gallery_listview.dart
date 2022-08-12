import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_gallery.dart';
import 'package:tour_360/providers/gallery.dart';

import '../screens/gallery_tour.dart';

class GalleryListView extends StatelessWidget {
  const GalleryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var galleries = Provider.of<GalleryData>(
      context,
      listen: false,
    ).getGalleries();
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: galleries.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          GalleryTour.routeName,
          arguments: {
            'id': galleries[index].id,
          },
        ),
        child: SingleGallery(
          id: galleries[index].id,
          title: galleries[index].title,
          imgSrc: galleries[index].displayImgSrc,
          location: galleries[index].location,
        ),
      ),
    );
  }
}
