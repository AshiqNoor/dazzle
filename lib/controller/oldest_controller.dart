import 'package:dazzle/controller/base_controlle.dart';
import 'package:flutter/material.dart';
import '../model/wallpaper.dart';
import '../services/rest_api.dart';
import '../view/utils/constant/const.dart';

class OldestController extends BaseControlle {
  final _restobj = RestApi();
  final ScrollController oldestcontroller = ScrollController();
  List<Wallpaper> oldestlist = [];
  int oldestpage = 2;
  Future<void> getListofOldest() async {
    setstate(true);
    oldestlist =
        await _restobj.convertJsonToObject(api + "&page=${1}&order_by=oldest");
    setstate(false);
  }

  void loadmoredata() {
    oldestcontroller.addListener(() async {
      if (oldestcontroller.position.pixels ==
          oldestcontroller.position.maxScrollExtent) {
        await adddataoldestlist();
      }
    });
  }

  Future<void> adddataoldestlist() async {
    setLoading(true);
    oldestlist.addAll(await _restobj
        .convertJsonToObject(api + "&page=$oldestpage&order_by=oldest"));
    oldestpage++;
    setLoading(false);
    update();
  }

  @override
  void onInit() {
    getListofOldest();
    loadmoredata();
    {
      super.onInit();
    }
  }
}
