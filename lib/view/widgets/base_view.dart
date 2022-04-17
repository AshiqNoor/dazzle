import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/screen/homeview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          bottomNavigationBar: BottomNavigationBar(
            //selectedFontSize: 15,
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).primaryColor, size: 25),
            // unselectedFontSize: 15,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: c.currentIndex,
            onTap: (val) {
              c.setCurrentIndex(val);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download),
                label: 'Download',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
          ),
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
    default:
      return const HomeView();
  }
}
