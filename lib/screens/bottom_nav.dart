import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_360/constants/constants.dart';
import 'package:tour_360/screens/favorite_screen.dart';
import 'package:tour_360/screens/gallery_screen.dart';
import 'package:tour_360/screens/home_screen.dart';
import 'package:tour_360/screens/places_screen.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/main';

  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _currentIndex = 0;
  final _pages = const [
    HomeScreen(),
    PlacesScreen(),
    GalleryScreen(),
    FavoriteScreen(),
  ];

  _setNewPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      drawer: const Drawer(),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: const FloatingActionButton(
      //   backgroundColor: primaryColor,
      //   onPressed: null,
      //   child: Icon(Icons.vrpano),
      // ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '360 Tours',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: accentColor,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: accentColor,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: accentColor,
                ),
              ),
            ),
          );
        }),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: accentColor,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.notifications_none,
                color: accentColor,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.8,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.red,
            elevation: 3,
            onTap: _setNewPage,
            currentIndex: _currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: primaryColor.withOpacity(0.4),
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        _currentIndex == 0 ? primaryColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.home),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        _currentIndex == 1 ? primaryColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.vrpano),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        _currentIndex == 2 ? primaryColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.vrpano_outlined),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        _currentIndex == 3 ? primaryColor : Colors.transparent,
                  ),
                  child: const Icon(Icons.favorite),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
    );
  }
}
