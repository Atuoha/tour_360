import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SingleGalleryGrid extends StatelessWidget {
  const SingleGalleryGrid({
    Key? key,
    required this.imgSrc,
    required this.location,
    required this.title,
    required this.id,
  }) : super(key: key);
  final String imgSrc;
  final String location;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 0.4,
          color: accentColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgSrc,
                    width: double.infinity,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => null, // Navigate to individual tour
                    child: const Icon(
                      Icons.vrpano,
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: accentColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: tileColor,
                  size:10
                ),
                const SizedBox(width: 5),
                Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: tileColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
