import 'package:flutter/material.dart';
import 'package:dazzle/view/utils/constant/const.dart';

class BottomList {
  String name;
  Widget? icon;
  BottomList({required this.name, this.icon});

  static final List<BottomList> bottomSheetName = [
    BottomList(name: setScreenAs, icon: const Icon(Icons.cancel_outlined)),
    BottomList(name: homeScreen, icon: const Icon(Icons.home_filled)),
    BottomList(name: lockScreen, icon: const Icon(Icons.lock_open)),
    BottomList(name: bothScreen, icon: const Icon(Icons.screen_lock_portrait)),
  ];
}
