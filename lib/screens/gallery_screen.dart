import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_360/providers/gallery.dart';
import '../components/galleries_gridview.dart';
import '../components/searchbox.dart';
import '../components/top_heading.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const TopHeading(title: 'Best Gallery Shots!'),
          const SizedBox(height: 10),
          const SearchBox(),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<GalleryData>(
              builder: (context, data, child) => data.getGalleries().isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset('assets/images/opps.png'),
                          const SizedBox(height: 20),
                          const Text(
                            'Ops! It\'s empty',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  : const GalleriesGridView(),
            ),
          )
        ],
      ),
    );
  }
}
