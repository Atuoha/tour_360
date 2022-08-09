import 'package:flutter/foundation.dart';
import 'package:tour_360/models/place.dart';

class PlaceData extends ChangeNotifier {
  toggleIsFav(int id) {
    var place = _places.firstWhere((place) => place.id == id);
    place.toggleIsFav();
    notifyListeners();
  }

  bool isFav(int id) {
    var place = _places.firstWhere(
      (place) => place.id == id,
    );
    return place.isFavorite;
  }

  findById(int id) {
    return _places.firstWhere(
      (place) => place.id == id,
    );
  }

  getPlaces() {
    return [..._places];
  }

  final _places = [
    Place(
      id: 1,
      title: 'Moneron Island',
      desc:
          'The Eurasian mainland and Sakhalin Island are separated by the Strait of Tartary, with its largest island known as Moneron. When an expedition led by La Perouse was exploring these waters in 1787, Paul Merault Monneron, a French engineer officer, discovered a new piece of land; the island was named after him. However, it was only "new" to Europeans; the indigenous people of this area, the Ainu, had known about it for a long time - they called it Todomoshiri ("island of sea lions"). When the Japanese mention the island, they say Kaibato: this name is a reference to the Ainu people.',
      location: 'Russsia',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/moneron_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/moneron-island/images/image1.jpg',
        'https://www.airpano.com/files/moneron-island/images/image2.jpg',
        'https://www.airpano.com/files/moneron-island/images/image3.jpg',
        'https://www.airpano.com/files/moneron-island/images/image4.jpg',
        'https://www.airpano.com/files/moneron-island/images/image5.jpg',
      ],
    ),

    Place(
      id: 2,
      title: 'National Park Lena Pillars',
      desc:
      'In Yakutia, on the banks of the Lena River, you can find the Lena Pillars Nature Park. It was inscribed on the UNESCO World Heritage List for its uniqueness, and it is a familiar name to all nature lovers and travelers. However, the park includes two types of "pillars": not only the Lena Pillars, but also the Sinyaya Pillars. The AirPano team did a shooting here, and this photo walk will allow you to appreciate their scale and magnificence.',
      location: 'Russsia',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/lena_pillars_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/lena-pillars-summer/images/image1.jpg',
        'https://www.airpano.com/files/lena-pillars-summer/images/image2.jpg',
        'https://www.airpano.com/files/lena-pillars-summer/images/image3.jpg',
        'https://www.airpano.com/files/lena-pillars-summer/images/image4.jpg',
        'https://www.airpano.com/files/lena-pillars-summer/images/image5.jpg',
      ],
    ),

    Place(
      id: 3,
      title: 'Mangyshlak, Kazakhstan',
      desc:
      'The Mangystau Region is located in the southwest of Kazakhstan, its area is over 170 thousand km2 (65,637 mi2), which is almost as large as all the Baltic countries combined. The climate is sharply continental, extremely dry. However, once a year in May, the heavens open for 7-10 days, which makes any dirt road almost impassable.',
      location: 'Kazakhstan',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/mangyshlak_kyzylkup.jpg',
      otherImgs: [
        'https://www.airpano.com/files/mangyshlak/images/image1.jpg',
        'https://www.airpano.com/files/mangyshlak/images/image2.jpg',
        'https://www.airpano.com/files/mangyshlak/images/image3.jpg',
        'https://www.airpano.com/files/mangyshlak/images/image4.jpg',
        'https://www.airpano.com/files/mangyshlak/images/image6.jpg',
      ],
    ),

    Place(
      id: 4,
      title: 'Salt Lake Elton',
      desc:
      'The lake is 15 m (49 ft) below sea level. It is 18 km long and 13 km wide and has an area of 1 640 km2 (633 mi2). The lake is fed by meltwater, so it is deepest, down to a meter and a half (4.9 ft), in spring, while in summer it is almost dried up, and even the seven mineral streams flowing into the lake are unable to raise the water level.',
      location: 'Russia',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/elton_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/elton-lake/images/image1.jpg',
        'https://www.airpano.com/files/elton-lake/images/image3.jpg',
        'https://www.airpano.com/files/elton-lake/images/image4.jpg',
        'https://www.airpano.com/files/elton-lake/images/image5.jpg',
        'https://www.airpano.com/files/mangyshlak/images/image6.jpg',
      ],
    ),

    Place(
      id: 5,
      title: 'Cancun and its surroundings, Mexico',
      desc:
      'Cancun is located on the sandy shore reminiscent of number "7", measuring 400 meters in width and 30 kilometers in length. The quality of Cancun\'s snow-white beaches is so high that not so long ago a wealthy American businessman purchased several barges of local sand for his country residence in New York.',
      location: 'Mexico',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/cancun_surroundings.jpg',
      otherImgs: [
        'https://www.airpano.com/files/cancun-2022/images/image1.jpg',
        'https://www.airpano.com/files/cancun-2022/images/image3.jpg',
        'https://www.airpano.com/files/cancun-2022/images/image7.jpg',
        'https://www.airpano.com/files/cancun-2022/images/image6.jpg',
        'https://www.airpano.com/files/cancun-2022/images/image5.jpg',
      ],
    ),

    Place(
      id: 6,
      title: 'Mexico City',
      desc:
      'Sights of Mexico City turned the capital into one of the most popular tourist destinations in North America. If put together, all of Mexico City\'s contrasts: high crime rate vs. hospitality of local residents, ultra modern skyscrapers vs. Aztec pyramids, slums vs. magnificent palaces, hills vs. plains — provide the city with a special unforgettable atmosphere.',
      location: 'Mexico',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/mexico_2022_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/mexico-city-2022/images/image2.jpg',
        'https://www.airpano.com/files/mexico-city-2022/images/image5.jpg',
        'https://www.airpano.com/files/mexico-city-2022/images/image6.jpg',
      ],
    ),

    Place(
      id: 7,
      title: 'Sicily Island',
      desc:
      'The Sicilian volcano is also among the highest in Europe: about 3,357 m (11,014 ft). This figure is constantly changing, as eruptions still take place, and the ejected rocks give new shapes to the mountain. And this is another record for Etna: not many volcanoes on Earth are in a constant state of activity. In the past half century alone, the volcano has made its presence felt on average every year and a half!',
      location: 'Italy',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/mexico_2022_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/italy-sicily/images/image4.jpg',
        'https://www.airpano.com/files/italy-sicily/images/image1.jpg',
        'https://www.airpano.com/files/italy-sicily/images/image2.jpg',
        'https://www.airpano.com/files/italy-sicily/images/image3.jpg',
      ],
    ),

    Place(
      id: 8,
      title: 'Cape Town',
      desc:
      'One of the countries available to be visited in the spring of 2021 was the Republic of South Africa. There was no quarantine at the arrival, the only thing you needed was a standard Covid-test. Thus we decided to take a risk and try to capture one of the most beautiful cities in the country, Cape Town.',
      location: 'South Africa',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/capetown_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/cape-town/images/image3.jpg',
        'https://www.airpano.com/files/cape-town/images/image2.jpg',
        'https://www.airpano.com/files/cape-town/images/image1.jpg',
        'https://www.airpano.com/files/cape-town/images/image4.jpg',
        'https://www.airpano.com/files/cape-town/images/image5.jpg',
        'https://www.airpano.com/files/cape-town/images/image7.jpg'
      ],
    ),

    Place(
      id: 10,
      title: ' Landmarks of Yunnan province',
      desc:
      'China is the third-largest country in the world. No wonder that a huge variety of attractions are located here: cultural, natural, historical landmarks can be found on its territory. Some of them, such as the Great Wall of China, are widely known; others are less known. This AirPano virtual tour introduces you to the "Cloudy South": the mountainous and picturesque province of Yunnan.',
      location: 'China',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/yunnan_province_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/china-yunnan-province/images/image1.jpg',
        'https://www.airpano.com/files/china-yunnan-province/images/image1.jpg',
        'https://www.airpano.com/files/china-yunnan-province/images/image3.jpg',
        'https://www.airpano.com/files/china-yunnan-province/images/image4.jpg',
        'https://www.airpano.com/files/china-yunnan-province/images/image5.jpg',
      ],
    ),
  ];
}
