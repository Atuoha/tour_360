import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SingleGallery extends StatelessWidget {
  const SingleGallery({
    Key? key,
    required this.id,
    required this.title,
    required this.imgSrc,
    required this.location,
  }) : super(key: key);
  final int id;
  final String title;
  final String imgSrc;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: ListTile(
        contentPadding:EdgeInsets.zero,
        // tileColor: Colors.red,
        leading: CircleAvatar(
          backgroundColor: imageBg,
          radius: 50,
          backgroundImage: NetworkImage(imgSrc),
        ),
        title:
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: tileColor,
          ),
        ),
        subtitle:
            Text(
              location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: tileColor,
              ),
            ),

        trailing: const IconButton(
          onPressed: null,   // Navigate to individual screen using id
          icon: Icon(
            Icons.vrpano,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
