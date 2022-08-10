import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/components/single_gallery.dart';
import 'package:tour_360/providers/gallery.dart';

class GalleryListView extends StatelessWidget {
  const GalleryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var galleries =
        Provider.of<GalleryData>(context, listen: false).getPlaces();
    return ListView.builder(
      padding: EdgeInsets.only(top:10),
      itemCount: galleries.length,
      itemBuilder: (context, index) => SingleGallery(
        id: galleries[index].id,
        imgSrc: galleries[index].displayImgSrc,
        location: galleries[index].location,
      ),
    );
  }
}
