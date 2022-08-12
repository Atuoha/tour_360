import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/providers/gallery.dart';
import '../constants/constants.dart';

class GalleryTour extends StatefulWidget {
  static const routeName = '/gallery_tour';

  const GalleryTour({Key? key}) : super(key: key);

  @override
  State<GalleryTour> createState() => _GalleryTourState();
}

enum Operation { increase, decrease }

class _GalleryTourState extends State<GalleryTour> {
  double zoomValue = 1.0;

  _zoomOperation(Operation operation) {
    switch (operation) {
      case Operation.increase:
        setState(() {
          zoomValue += 1.0;
        });
        break;

      case Operation.decrease:
        setState(() {
          zoomValue -= 1.0;
        });
        break;
    }
  }

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
            zoom: zoomValue,
            child: Image.network(gallery.displayImgSrc),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              height: 50,
              width: 20,
              decoration: BoxDecoration(
                color: imageBg.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _zoomOperation(Operation.increase),
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () => _zoomOperation(Operation.decrease),
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
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
                color: imageBg.withOpacity(0.4),
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
