import 'package:flutter/foundation.dart';
import 'package:tour_360/models/gallery.dart';

class GalleryData extends ChangeNotifier {
  Gallery findById(int id) {
    return _galleries.firstWhere(
      (area) => area.id == id,
    );
  }

  getGalleries() {
    return [..._galleries];
  }

  final _galleries = [
    Gallery(
      id: 1,
      title: 'Central Park',
      location: 'New York, USA',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_1550/36_645994.jpg',
    ),
    Gallery(
      id: 2,
      title: 'Riomaggiore',
      location: 'Cinque Terre, Italy',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_078202.jpg',
    ),
    Gallery(
      id: 3,
      title: 'Main Amphitheater',
      location: 'USA',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_149426.jpg',
    ),
    Gallery(
      id: 4,
      title: 'Lotus Temple',
      location: 'Delhi, India',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_390689.jpg',
    ),
    Gallery(
      id: 5,
      title: 'Iguazu falls',
      location: 'Argentina-Brazil',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_150203.jpg',
    ),
    Gallery(
      id: 6,
      title: 'Shanghai City',
      location: 'Shanghai, China',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_688878.jpg',
    ),
    Gallery(
      id: 7,
      title: 'Trinity Lavra of St. Sergius',
      location: 'Sergiyev Posad, Russia',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_429603.jpg',
    ),
    Gallery(
      id: 8,
      title: 'Buenos Aires',
      location: 'Argentina',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_135613.jpg',
    ),
    Gallery(
      id: 9,
      title: 'Iguazu falls',
      location: 'Argentina-Brazil',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_150203.jpg',
    ),
    Gallery(
      id: 10,
      title: 'Kremlin Star',
      location: 'Unknown',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_455896.jpg',
    ),
    Gallery(
      id: 11,
      title: 'Cathedral Square',
      location: 'Unknown',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_472878_ThebestAirPanophotos.jpg',
    ),
    Gallery(
      id: 12,
      title: 'Shanghai City',
      location: 'Shanghai',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_150_vert/36_113374_ThebestAirPanophotos.jpg',
    ),
    Gallery(
      id: 13,
      title: 'Singapore City',
      location: 'Singapore',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_1550/36_678320_ThebestAirPanophotos.jpg',
    ),
    Gallery(
      id: 14,
      title: 'Golden Eagles is flying above the Red Square',
      location: 'Moscow ',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_1550/36_355253_ThebestAirPanophotos.jpg',
    ),
    Gallery(
      id: 15,
      title: 'Swaminarayan Akshardham',
      location: 'Delhi, India ',
      displayImgSrc:
          'https://www.airpano.com/photogallery/images_1550/36_690858.jpg',
    )
  ];
}

//https://www.airpano.com/gallery.php?gallery=36        -To get more gallery images
