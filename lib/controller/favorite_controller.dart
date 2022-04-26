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
    Wallpaper wallpaper = Wallpaper(
      description: data.description,
      altDescription: data.altDescription,
      urls: data.urls,
    );
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

  void favtoggole(var data) {
    isfav = !isfav;
    if (isfav) {
      addFavorite(data);
    } else {
      deleteFavorite(data.urls.regular);
    }
    update();
  }
}
