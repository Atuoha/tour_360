import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../providers/place.dart';
import 'package:readmore/readmore.dart';

class PlaceDetails extends StatefulWidget {
  static const routeName = '/placeDetails';

  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var place = Provider.of<PlaceData>(context).findById(id);
    var imageIndex = 0;

    updateImageIndex(int index) {
      setState(() {
        imageIndex = index;
      });
    }

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: accentColor,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.chevron_left,
                  color: accentColor,
                ),
              ),
            ),
          );
        }),
        actions: [
          GestureDetector(
            onTap: () => place.toggleIsFav(id),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: accentColor,
                ),
              ),
              child: Center(
                child: Icon(
                  place.isFav(id) ? Icons.favorite : Icons.favorite_border,
                  color: place.isFav(id) ? Colors.red : Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  place.otherImgs[imageIndex],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: tileColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      place.location,
                      style: const TextStyle(
                        color: tileColor,
                      ),
                    )
                  ],
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    color: accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                ReadMoreText(
                  place.desc,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  colorClickableText: primaryColor,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: primaryColor,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 10
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                // enlargeCenterPage: true,
                height: 120,
                // padEnds: false
              ),
              itemCount: place.otherImgs.length,
              itemBuilder: (context, index, i) => GestureDetector(
                onTap: () => updateImageIndex(index),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        place.imgSrc[index],
                      ),
                    ),
                  ),
                  child: index == imageIndex
                      ? Center(
                          child: Image.asset(
                            'assets/images/check.png',
                            width: 100,
                          ),
                        )
                      : const Text(''),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
