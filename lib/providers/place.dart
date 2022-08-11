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

  Place findById(int id) {
    return _places.firstWhere(
      (place) => place.id == id,
    );
  }

  getPlaces() {
    return [..._places];
  }

 List<Place>getFavorites(){
    List<Place> favList = [];
    for (var place in _places) {
      if(place.isFavorite) favList.add(place);
    }
    return favList;
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
      id: 9,
      title: 'Caroline Atoll',
      desc:
      'Caroline atoll was the absolute highlight and the main destination of my 2019 catamaran expedition in the Pacific Ocean.This atoll lies around 837 km to the North of Tahiti, but it\'s 24 hours ahead in time. So if it is Monday on Tahiti, it is already Tuesday on Caroline — and technically, those who are on this atoll are in front of everyone else on Earth in time. This cruise had only two participants: my talented Polynesian captain, Teahui, and myself, the crazy man who in 2018 came up with the idea of contacting a Tahitian catamaran charter company, Poe Charters, to go to this remote atoll. Among the captains of this company nobody has ever been to Caroline atoll, so when this project emerged, all the captains were competing to get the job. No wonder the job was given to the best, the craziest, most daring captain. Teahui said this was a once in a lifetime opportunity for him!',
      location: 'Kiribati',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/caroline_atoll_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image5.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image1.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image9.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image12.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image8.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/125.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/116.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/124.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/120.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/118.jpg'
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/115.jpg'
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image3.jpg'
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/121.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image11.jpg',
        'https://www.airpano.com/files/caroline-atoll-kiribati/images/image4.jpg'
      ],
    ),

    Place(
      id: 10,
      title: 'Landmarks of Yunnan province',
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


    Place(
      id: 11,
      title: 'Guatemala City',
      desc:
      'Guatemala is not only the largest city in the country but also in Central America. The area of almost 700 square kilometres is home to around 2.5 million people while the architecture represents a harmonious combination of antiquity and modernity.',
      location: 'Guatemala',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/guatemala_city_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/guatemala-city/images/image3.jpg',
        'https://www.airpano.com/files/guatemala-city/images/image6.jpg',
        'https://www.airpano.com/files/guatemala-city/images/image2.jpg',
        'https://www.airpano.com/files/guatemala-city/images/image1.jpg',
        'https://www.airpano.com/files/guatemala-city/images/image5.jpg',
        'https://www.airpano.com/files/guatemala-city/images/image4.jpg'
      ],
    ),

    Place(
      id: 12,
      title: 'Fira, Santorini Island',
      desc:
      'Greece embraces more than 1000 islands, with Santorini (also named Thira) being one of the most famous of them. It is mentioned in ancient Greek myths, and moreover, it was the site for one of the most famous stories about the Rape of Europa. Around 1,500 BC, the eruption of the Santorini volcano changed the island\'s borders: the crater collapsed, forming a huge funnel (caldera). Eventually, on the slopes and the summit of this mountain at an altitude of about 400 meters, a city was born and received the same name as the entire island, Fira (sometimes also transcribed as "Thira"). The city grew and developed until a devastating earthquake struck the island in 1956 destroying more than 80% of all buildings. Afterwards, Fira was rebuilt and now what we witness is the renewed form of the settlement.',
      location: 'Greece',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/fira_02.jpg',
      otherImgs: [
        'https://www.airpano.com/files/santorini-fira/images/image2.jpg',
        'https://www.airpano.com/files/santorini-fira/images/image3.jpg',
        'https://www.airpano.com/files/santorini-fira/images/image4.jpg',

      ],
    ),

    Place(
      id: 13,
      title: 'Vodlozero National Park, Republic of Karelia',
      desc:
      'Karelia is known as the land of a thousand lakes. But that\'s a severe understatement: there are at least 60,000 of them in this region. The largest lakes of this area are Lake Ladoga and Lake Onega; along with them, there is a smaller and less famous but equally beautiful Lake Vodlozero. It is located in the southeastern part of the Republic of Karelia and covers 358 km².',
      location: 'Russia',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/vodloozero_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/vodlozero/images/image2.jpg',
        'https://www.airpano.com/files/vodlozero/images/image3.jpg',
        'https://www.airpano.com/files/vodlozero/images/image4.jpg',
        'https://www.airpano.com/files/vodlozero/images/image5.jpg',
        'https://www.airpano.com/files/vodlozero/images/image6.jpg',
        'https://www.airpano.com/files/vodlozero/images/image8.jpg'
        'https://www.airpano.com/files/vodlozero/images/image7.jpg'
      ],
    ),


    Place(
      id: 14,
      title: 'Tel Aviv-Yafo',
      desc:
      'Tel Aviv is a relatively young city with its life inextricably linked to ancient Jaffa. AirPano virtual tour is dedicated to these remarkable and full of legends places.The first recorded mention of Jaffa goes back to the ancient Egyptian chronicles dated the 15th century BC. Its shore, according to ancient Greek mythology, is reputed to have been the place where Andromeda was rescued by Perseus. It is the place whence the prophet Jonah embarked for his journey and while the Apostle Peter was in Jaffa, he had a vision here.',
      location: 'Israel',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/tel_aviv_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/tel-aviv/images/image1.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image6.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image7.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image3.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image2.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image5.jpg',
        'https://www.airpano.com/files/tel-aviv/images/image8.jpg',

      ],
    ),


    Place(
      id: 15,
      title: 'Meknes',
      desc:
      'The history of Morocco counts four capital cities: Fez, Marrakesh, Rabat and Meknes. The latter one functioned as the imperial capital only for a short time, between 1673 and 1727, but it was the period of being Morocco\'s "Versailles". Nowadays it is a UNESCO World Heritage Site and this AirPano virtual tour is focused on this unique place.',
      location: 'Morocco',
      displayImgSrc: 'https://www.airpano.ru/files/r_450/meknes_01.jpg',
      otherImgs: [
        'https://www.airpano.com/files/meknes/images/image6.jpg',
        'https://www.airpano.com/files/meknes/images/image1.jpg',
        'https://www.airpano.com/files/meknes/images/image2.jpg',
        'https://www.airpano.com/files/meknes/images/image3.jpg',
        'https://www.airpano.com/files/meknes/images/image8.jpg',
        'https://www.airpano.com/files/meknes/images/image4.jpg',

      ],
    ),
  ];
}


//https://www.airpano.com/360photo_list.php     -To get more places