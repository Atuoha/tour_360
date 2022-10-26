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
  double zoomValue = 0.5;

  _zoomOperation(Operation operation) {
    switch (operation) {
      case Operation.increase:
        setState(() {
          zoomValue += 0.5;
        });
        break;

      case Operation.decrease:
        setState(() {
          zoomValue -= 0.5;
        });
        break;
    }
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var gallery = Provider.of<GalleryData>(context).findById(id);

    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: primaryLite,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: const Text('Go back'),
        backgroundColor: primaryColor.withOpacity(0.6),
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
            top: 70,
            right: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              height: 110,
              width: 60,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  IconButton(
                    onPressed: _zoomOperation(Operation.increase),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed:  _zoomOperation(Operation.decrease),
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 100,
            right: 120,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/swipeLeft.gif',
                  width: 100,
                ),
                Image.asset(
                  'assets/images/swipeRight.gif',
                  width: 100,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 75,
            right: 30,
            left: 30,
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '${gallery.title} | ${gallery.location}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
