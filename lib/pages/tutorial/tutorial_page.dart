import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_interactive_app/customColor.dart';
import 'package:sports_interactive_app/pages/play/play_page.dart';
import 'package:sports_interactive_app/pages/tutorial/tutorial_view_model.dart';

import '../../Extension/ExtensionCustomClipper.dart';
import '../../asset.dart';
import '../../const.dart';
import '../../model/page_model.dart';
import '../../osc/osc.dart';
import '../base_page.dart';

class TutorialPage extends BasePage {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _oscModelProvider = ref.watch(oscModelProvider);
    final _tutorialProvider = ref.watch(tutorialProvider);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Stack(children: [
            Container(
              color: CustomColor.tutorialBack,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          width: 1295.w,
                          height: 425.h,
                          child: Image.asset(
                              Asset.imagePath("img_look_2_tab.png"))),
                    ),
                    Container(
                      child: ClipPath(
                        clipper: ParallelogramClipper(
                            1850.w, 285.h, util.parallelogramOffset(285.h, 30)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _tutorialProvider.toggleBlur();
                          },
                          child: Container(
                            width: 1850.w,
                            height: 285.h,
                            child: Image.asset(
                              Asset.imagePath("btn_skip_tab.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IgnorePointer(
              ignoring: _tutorialProvider.blurHidden,
              child: AnimatedOpacity(
                opacity: _tutorialProvider.blurHidden ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: 160.h),
                              child: Text(
                                "チュートリアルを終了して\nゲームを始めますか？",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "NotoSansMonoCJKjp",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 130.sp,
                                    color: Colors.white),
                              )),
                          Container(
                            width: double.infinity,
                            height: 455.h,
                            padding: EdgeInsets.only(left: 400.w, right: 400.w),
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: (864.w -
                                          util.parallelogramOffset(455.h, 30) +
                                          10.w) *
                                      0,
                                  width: 864.w,
                                  height: 455.h,
                                  child: ClipPath(
                                      clipper: ParallelogramClipper(
                                          864.w,
                                          455.h,
                                          util.parallelogramOffset(455.h, 30)),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {_tutorialProvider.toggleBlur();},
                                        child: Container(
                                          width: 864.w,
                                          height: 455.h,
                                          child: Image.asset(
                                            Asset.imagePath(
                                                "btn_skip_back_tab.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  top: 0,
                                  left: (864.w -
                                          util.parallelogramOffset(455.h, 30) +
                                          10.w) *
                                      1,
                                  width: 864.w,
                                  height: 455.h,
                                  child: ClipPath(
                                      clipper: ParallelogramClipper(
                                          864.w,
                                          455.h,
                                          util.parallelogramOffset(455.h, 30)),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          pageViewModel.navigateNextPage(Consts.pathPlay);
                                          _tutorialProvider.reset();
                                          _oscModelProvider.oscPageSend(PageIndex.play);
                                        },
                                        child: Stack(children: [
                                          Container(
                                            width: 864.w,
                                            height: 455.h,
                                            child: Image.asset(
                                              Asset.imagePath(
                                                  "btn_skip_yes_tab.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ]),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        )));
  }
}
