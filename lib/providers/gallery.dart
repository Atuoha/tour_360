import 'package:flutter/foundation.dart';
import 'package:tour_360/models/gallery.dart';

class GalleryData extends ChangeNotifier {
  findById(int id) {
    return _areas.firstWhere(
      (area) => area.id == id,
    );
  }

  getPlaces() {
    return [..._areas];
  }

  final _areas = [
    Gallery(
      id: 1,
      location: 'Central Park, New York, USA',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_1550/36_645994.jpg',
    ),

    Gallery(
      id: 2,
      location: 'Riomaggiore, Cinque Terre, Italy',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_078202.jpg',
    ),


    Gallery(
      id: 3,
      location: 'Main Amphitheater, USA',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_149426.jpg',
    ),

    Gallery(
      id: 4,
      location: 'Lotus Temple. Delhi, India',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_390689.jpg',
    ),

    Gallery(
      id: 5,
      location: 'Iguazu falls, Argentina-Brazil',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_150203.jpg',
    ),

    Gallery(
      id: 6,
      location: 'Shanghai, China',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_688878.jpg',
    ),

    Gallery(
      id: 7,
      location: 'Trinity Lavra of St. Sergius. Sergiyev Posad, Russia',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_429603.jpg',
    ),

    Gallery(
      id: 8,
      location: 'Buenos Aires, Argentina',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_135613.jpg',
    ),

    Gallery(
      id: 9,
      location: 'Iguazu falls, Argentina-Brazil',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_150203.jpg',
    ),

    Gallery(
      id: 10,
      location: 'Kremlin Star',
      displayImgSrc:
      'https://www.airpano.com/photogallery/images_150_vert/36_455896.jpg',
    ),

  ];
}


//https://www.airpano.com/gallery.php?gallery=36        -To get more gallery images