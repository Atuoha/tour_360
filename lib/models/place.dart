import 'package:flutter/material.dart';
class Place extends ChangeNotifier {
  final int id;
  final String title;
  final String desc;
  final String location;
  final String displayImgSrc;
  final List<String> otherImgs;
  bool isFavorite;

  Place({
    this.isFavorite = false,
    required this.id,
    required this.title,
    required this.desc,
    required this.location,
    required this.displayImgSrc,
    required this.otherImgs,
  });

  toggleIsFav(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
