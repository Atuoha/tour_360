import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../providers/place.dart';

class PlaceTour extends StatefulWidget {
  static const routeName = '/place_tour';

  const PlaceTour({Key? key}) : super(key: key);

  @override
  State<PlaceTour> createState() => _PlaceTourState();
}

enum Operation { increase, decrease }

class _PlaceTourState extends State<PlaceTour> {
  double zoomValue = 0.5;
  int imageIndex = 0;

  _changeImageIndex(int index) {
    setState(() {
      imageIndex = index;
    });
  }

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
  Widget build(BuildContext context) {
    var data =
    ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var place = Provider.of<PlaceData>(context).findById(id);

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
            child: Image.network(place.otherImgs[imageIndex]),
          ),

          // otherImgs
          Positioned(
            top: 50,
            left: 10,
            width: 150,
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2.4,
              child: ListView.builder(
                itemCount: place.otherImgs.length,
                itemBuilder: (context, index) =>
                    GestureDetector(
                      onTap: () => _changeImageIndex(index),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 80,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              place.otherImgs[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: imageBg,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: primaryColor.withOpacity(0.7),
                          ),
                        ),
                        child: index == imageIndex
                            ? Center(
                            child: Icon(Icons.check_circle, color: primaryColor
                                .withOpacity(0.7),)
                        )
                            : const Text(''),
                      ),
                    ),
              ),
            ),
          ),

          // hand indications for swiping
          Positioned(
            top: 100,
            bottom: 100,
            right: 20,
            // left: 65,
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
                    onPressed: () => _zoomOperation(Operation.increase),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _zoomOperation(Operation.decrease),
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
                  '${place.title} | ${place.location}',
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
