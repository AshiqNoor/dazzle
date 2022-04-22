import 'package:dazzle/controller/search_controller.dart';
import 'package:dazzle/view/utils/helper/color_helper.dart';
import 'package:dazzle/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../utils/share/progress_indicator.dart';
import '../utils/share/search_share.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (c) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: whitecolor,
                elevation: 3,
                title: SearchBar(
                  width: _width,
                  onSubmit: (String value) {
                    c.getListofSearch();
                  },
                  textcontroller: c.textcontroller,
                ),
              ),
              body: c.state
                  ? const Center(child: MidProgIndicator())
                  : ShareGridWidget1(
                      scrollController: c.searchcontroller,
                      isLoading: c.isloading,
                      wallpaper: c.searchlist,
                    ));
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
