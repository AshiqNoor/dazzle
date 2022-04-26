import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/screen/homeview.dart';
import 'package:dazzle/view/screen/search_view.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
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
              color: whiteCOLOR,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: blackCOLOR.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                      //tabBorderRadius: 20,
                      rippleColor: lightBlueCOLOR,
                      hoverColor: blueCOLOR,
                      gap: 8,
                      activeColor: whiteCOLOR,
                      iconSize: 25,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      duration: const Duration(milliseconds: 400),
                      color: Theme.of(context).primaryColor,
                      tabs: const [
                        GButton(
                            icon: Icons.home_outlined,
                            text: homeText,
                            //textColor: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: whiteCOLOR,
                                fontWeight: FontWeight.w600),
                            backgroundGradient: LinearGradient(
                              colors: [lightCyanCOLOR, lightBlueCOLOR],
                            )),
                        GButton(
                          icon: Icons.download_outlined,
                          text: downloadText,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: whiteCOLOR,
                              fontWeight: FontWeight.w600),
                          backgroundGradient: LinearGradient(
                            colors: [lightCyanCOLOR, lightBlueCOLOR],
                          ),
                        ),
                        GButton(
                          icon: Icons.favorite_outline,
                          text: favoriteText,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: whiteCOLOR,
                              fontWeight: FontWeight.w600),
                          backgroundGradient: LinearGradient(
                            colors: [
                              lightCyanCOLOR,
                              lightBlueCOLOR
                              //   Color.fromARGB(255, 148, 231, 199),
                              // Color.fromARGB(255, 62, 226, 212)
                            ],
                          ),
                        ),
                        GButton(
                          icon: Icons.search_outlined,
                          text: searchText,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: whiteCOLOR,
                              fontWeight: FontWeight.w600),
                          backgroundGradient: LinearGradient(
                            colors: [lightCyanCOLOR, lightBlueCOLOR],
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
