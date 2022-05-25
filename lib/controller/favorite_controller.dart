import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:hive/hive.dart';

import '../model/wallpaper.dart';

class FavoriteController extends BaseControlle {
  Box<Wallpaper>? favbox;
  bool isfav = false;
  //bool isSearch = false;
  @override
  void onInit() {
    favbox = Hive.box<Wallpaper>(favoriteHiveBox);
    super.onInit();
  }

  void addFavorite(var data) {
    try {
      Wallpaper wallpaper = Wallpaper(
        description: data.description,
        altDescription: data.altDescription,
        urls: data.urls,
      );
      favbox!.put(wallpaper.urls.regular, wallpaper);
    } catch (e) {
      //print(e);
    }
  }

  void deleteFavorite(String key) {
    try {
      favbox!.delete(key);
    } catch (e) {
      //print(e);
    }
  }

  inlist(String key) {
    try {
      var val = favbox!.get(key);
      if (val == null) {
        isfav = false;
      } else {
        isfav = true;
      }
      update();
    } catch (e) {
      //print(e);
    }
  }

  void favtoggole(var data) {
    try {
      isfav = !isfav;
      if (isfav) {
        addFavorite(data);
      } else {
        deleteFavorite(data.urls.regular);
      }
      update();
    } catch (e) {
      //print(e);
    }
  }
}
