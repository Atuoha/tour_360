import 'package:flutter/material.dart';
import 'package:tour_360/constants/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.8, color: accentColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/images/search.png', width: 50),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Location',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffix: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Image.asset(
                    'assets/images/filter.png',
                    width:50,
                    color: Colors.white,
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
