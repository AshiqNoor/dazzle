import 'package:dazzle/controller/search_controller.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../utils/share/progress_indicator.dart';
import '../utils/share/share_grid_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.isConnectivity}) : super(key: key);
  final bool isConnectivity;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (c) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: topbotomColor,
                elevation: elevationNo,
                title: SearchBar(
                  width: _width,
                  onSubmit: (String value) {
                    c.getListofSearch();
                  },
                  textcontroller: c.textcontroller,
                ),
              ),
              body: RefreshIndicator(
                  onRefresh: () async {
                    await c.getListofSearch();
                  },
                  child: isConnectivity
                      ? c.textcontroller.text.isEmpty
                          ? Container()
                          : c.searchlist.isEmpty
                              ? const Center(child: Text(searchResult))
                              : c.state
                                  ? const Center(
                                      child: ProgIndicator(
                                      indicator: Indicator.ballSpinFadeLoader,
                                    ))
                                  : ShareGridWidget(
                                      scrollController: c.searchcontroller,
                                      isLoading: c.isloading,
                                      wallpaper1: c.searchlist,
                                      isSearch: true,
                                    )
                      : const Center(
                          child: Text(
                          "No Internet Connection",
                          style: TextStyle(
                            fontSize: 20,
                            color: greyCOLOR,
                          ),
                        ))));
        });
  }
}



















// // import 'package:dazzle/controller/search_controller.dart';
// // import 'package:dazzle/view/utils/helper/color_helper.dart';
// // import 'package:dazzle/view/utils/share/share_grid_widget.dart';
// // import 'package:dazzle/view/widgets/search_bar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get_state_manager/src/simple/get_state.dart';

// // import '../utils/share/progress_indicator.dart';
// // import '../utils/share/search_share.dart';

// // class SearchView extends StatelessWidget {
// //   const SearchView({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     return GetBuilder<SearchController>(
// //         init: SearchController(),
// //         builder: (c) {
// //           return Scaffold(
// //             appBar: AppBar(
// //               centerTitle: true,
// //               backgroundColor: whitecolor,
// //               elevation: 3,
// //               title: SearchBar(
// //                 width: width,
// //                 infild: c.textcontroller,
// //               ),
// //             ),
// //             body: c.state
// //                 ? const Center(child: MidProgIndicator())
// //                 : ShareGridWidget1(
// //                     sdata: c.searchlist,
// //                     scrollController: c.searchcontroller,
// //                     isLoading: c.isloading,
// //                   ),
// //           );
// //         });
// //   }
// // }
