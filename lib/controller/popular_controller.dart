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
    popularlist =
        await _restobj.convertJsonToObject(api + "&page=${1}&order_by=popular");
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
        .convertJsonToObject(api + "&page=$popularpage&order_by=popular"));
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
}
