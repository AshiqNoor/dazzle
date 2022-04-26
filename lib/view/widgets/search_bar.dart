import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:dazzle/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final double? width;
  final Function(String value) onSubmit;
  final TextEditingController textcontroller;
  const SearchBar({
    Key? key,
    this.width = 200,
    required this.onSubmit,
    required this.textcontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 5, right: 20),
          child: GetBuilder<SearchController>(
            init: SearchController(),
            // initState: (_) {},
            builder: (c) {
              return TextField(
                  controller: textcontroller,
                  autofocus: true,
                  onSubmitted: onSubmit,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: searchText,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: blackgreyCOLOR,
                    ),
                    border: InputBorder.none,
                  ));
            },
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: whiteCOLOR,
        boxShadow: [
          BoxShadow(
            color: blackCOLOR.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
