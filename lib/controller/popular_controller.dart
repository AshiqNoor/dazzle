import 'package:dazzle/controller/base_controlle.dart';
import 'package:flutter/material.dart';
import '../model/wallpaper.dart';
import '../services/rest_api.dart';
import '../view/utils/constant/const.dart';

class PopularController extends BaseControlle {
  final _restobj = RestApi();
  final ScrollController popularcontroller = ScrollController();
  List<Wallpaper> popularlist = [];
  int popularpage = 2;
  Future<void> getListofPopular() async {
    setstate(true);
    popularlist = await _restobj
        .convertJsonToObject(api + order + popular + page + '${1}');
    setstate(false);
  }

  void loadmoredata() {
    popularcontroller.addListener(() async {
      if (popularcontroller.position.pixels ==
          popularcontroller.position.maxScrollExtent) {
        await adddatapopularlist();
      }
    });
  }

  Future<void> adddatapopularlist() async {
    setLoading(true);
    popularlist.addAll(await _restobj
        .convertJsonToObject(api + order + latest + '$page $popularpage'));
    popularpage++;
    setLoading(false);
    update();
  }

  @override
  void onInit() {
    getListofPopular();
    loadmoredata();
    {
      super.onInit();
    }
  }

  @override
  void onClose() {
    popularcontroller.dispose();
    super.onClose();
  }
}
