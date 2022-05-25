import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/result.dart';
import 'package:dazzle/services/search_api.dart';
import 'package:flutter/material.dart';
import '../view/utils/constant/const.dart';

class SearchController extends BaseControlle {
  final _restobj = SearchApi();
  final ScrollController searchcontroller = ScrollController();
  final TextEditingController textcontroller = TextEditingController();
  List<Result> searchlist = [];
  int searchpage = 2;
  Future<void> getListofSearch() async {
    try {
      setstate(true);
      searchlist = await _restobj.convertsearchJsonToObject(
          searchapi + '$page${1}' + '$query${textcontroller.text}');
      setstate(false);
    } catch (e) {
      //print(e);
    }
  }

  void loadmoredata() {
    try {
      searchcontroller.addListener(() async {
        if (searchcontroller.position.pixels ==
            searchcontroller.position.maxScrollExtent) {
          await adddatasearchlist();
        }
      });
    } catch (e) {
      //print(e);
    }
  }

  Future<void> adddatasearchlist() async {
    try {
      setLoading(true);
      searchlist.addAll(await _restobj.convertsearchJsonToObject(
          searchapi + '$page $searchpage' + '$query${textcontroller.text}'));
      searchpage++;
      setLoading(false);
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    loadmoredata();
    {
      super.onInit();
    }
  }

  // @override
  // void onClose() {
  //   searchcontroller.dispose();
  //   super.onClose();
  // }
}
