import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/screen/homeview.dart';
import 'package:dazzle/view/screen/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screen/download_view.dart';
import '../screen/fav_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControlle>(
      init: BaseControlle(),
      // initState: (_) {},
      builder: (c) {
        return Scaffold(
          body: getWidgetByIndex(c.currentIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                      //tabBorderRadius: 20,
                      rippleColor: Colors.blue[300]!,
                      hoverColor: Colors.blue,
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 20,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      duration: const Duration(milliseconds: 400),
                      color: Theme.of(context).primaryColor,
                      tabs: const [
                        GButton(
                            icon: Icons.home_outlined,
                            text: 'Home',
                            backgroundGradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 148, 231, 225),
                                Color.fromARGB(255, 62, 182, 226)
                              ],
                            )),
                        GButton(
                          icon: Icons.download_outlined,
                          text: 'Download',
                          backgroundGradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 148, 231, 225),
                              Color.fromARGB(255, 62, 182, 226)
                            ],
                          ),
                        ),
                        GButton(
                          icon: Icons.favorite_outline,
                          text: 'Favorite',
                          backgroundGradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 148, 231, 225),
                              Color.fromARGB(255, 62, 182, 226)
                              //   Color.fromARGB(255, 148, 231, 199),
                              // Color.fromARGB(255, 62, 226, 212)
                            ],
                          ),
                        ),
                        GButton(
                          icon: Icons.search_outlined,
                          text: 'Search',
                          backgroundGradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 148, 231, 225),
                              Color.fromARGB(255, 62, 182, 226)
                            ],
                          ),
                        ),
                      ],
                      selectedIndex: c.currentIndex,
                      onTabChange: (val) {
                        c.setCurrentIndex(val);
                      })),
            ),
          ),

          //*********old navigation bar*************
          // BottomNavigationBar(
          //   //selectedFontSize: 15,
          //   selectedIconTheme:
          //       IconThemeData(color: Theme.of(context).primaryColor, size: 25),
          //   // unselectedFontSize: 15,
          //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          //   currentIndex: c.currentIndex,
          //   onTap: (val) {
          //     c.setCurrentIndex(val);
          //   },
          //   items: const [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.download),
          //       label: 'Download',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.favorite),
          //       label: 'Favorite',
          //     ),
          //   ],
          // ),
        );
      },
    );
  }
}

Widget getWidgetByIndex(int index) {
  switch (index) {
    case 0:
      return const HomeView();
    case 1:
      return const DownloadView();
    case 2:
      return const FavView();
    case 3:
      return const SearchView();
    default:
      return const HomeView();
  }
}
