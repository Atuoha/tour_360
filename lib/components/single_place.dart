import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../providers/place.dart';

class SinglePlace extends StatelessWidget {
  const SinglePlace({
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
    var placeProvider = Provider.of<PlaceData>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 0.4,
          color: accentColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgSrc,
                    width: double.infinity,
                    height:170,
                    fit:BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: GestureDetector(
                    onTap: () => placeProvider.toggleIsFav(id),
                    child: Icon(
                      placeProvider.isFav(id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          placeProvider.isFav(id) ? Colors.red : Colors.white,
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
            const SizedBox(height:10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: tileColor,
                ),
                const SizedBox(width: 5),
                Text(
                  location,
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
