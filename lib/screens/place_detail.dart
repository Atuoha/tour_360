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
    var place = Provider.of<PlaceData>(context, listen: false).findById(id);
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(),
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
                  color: Colors.white,
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
                  place.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: place.isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color:imageBg,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    place.otherImgs[imageIndex],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
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
                    // style:TextStyle(fontSize:),
                    place.desc,
                    textAlign: TextAlign.justify,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read less',
                    colorClickableText: primaryColor,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: primaryColor,
                    blurRadius: 5,
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  // enlargeCenterPage: true,
                  height: 150,
                  // padEnds: false
                ),
                itemCount: place.otherImgs.length,
                itemBuilder: (context, index, i) => GestureDetector(
                  onTap: () => updateImageIndex(index),
                  child: Container(
                    // height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          place.otherImgs[index],
                        ),
                        fit:BoxFit.cover,
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
      ),
    );
  }
}
