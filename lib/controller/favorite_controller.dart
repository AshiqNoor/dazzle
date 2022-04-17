import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive/hive.dart';

import '../model/wallpaper.dart';

class FavoriteController extends BaseControlle {
  Box<Wallpaper>? favbox;
  bool isfav = false;
  @override
  void onInit() {
    favbox = Hive.box<Wallpaper>(favoriteHiveBox);
    super.onInit();
  }

  void addFavorite(Wallpaper data) {
    Wallpaper wallpaper = Wallpaper(
        description: data.description,
        altDescription: data.altDescription,
        urls: data.urls);
    favbox!.put(wallpaper.urls.regular, wallpaper);
  }

  void deleteFavorite(String key) {
    favbox!.delete(key);
  }

  inlist(String key) {
    var val = favbox!.get(key);
    if (val == null) {
      isfav = false;
    } else {
      isfav = true;
    }
    update();
  }

  void favtoggole(Wallpaper data) {
    isfav = !isfav;
    if (isfav) {
      addFavorite(data);
    } else {
      deleteFavorite(data.urls.regular);
    }
    update();
  }
}
