import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/providers/gallery.dart';
import '../constants/constants.dart';

class GalleryTour extends StatelessWidget {
  static const routeName = '/gallery_tour';
  const GalleryTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var gallery = Provider.of<GalleryData>(context).findById(id);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text('Go back'),
        backgroundColor: primaryColor,
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.chevron_left),
      ),
      body: Stack(
        children: [
          Panorama(
            child: Image.network(gallery.displayImgSrc),
          ),
          Positioned(
            bottom: 10,
            right: 30,
            left: 30,
            child: Container(
              height: 40,
              width: 50,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: imageBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${gallery.title} ${gallery.location}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
