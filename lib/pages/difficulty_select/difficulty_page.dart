import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruby_text/ruby_text.dart';
import 'package:sports_interactive_app/customColor.dart';
import 'package:sports_interactive_app/model/difficulty_model.dart';
import 'package:sports_interactive_app/pages/tutorial/tutorial_page.dart';
import '../../Extension/ExtensionCustomClipper.dart';
import '../../asset.dart';
import '../../const.dart';
import '../../model/page_model.dart';
import '../../osc/osc.dart';
import '../base_page.dart';
import 'difficulty_view_model.dart';

class DifficultyPage extends BasePage {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _oscModelProvider = ref.watch(oscModelProvider);
    final _difficultyProvider = ref.watch(difficultyProvider);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.black87,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 58.h,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: ClipPath(
                  clipper: BackButtonClipper(579.w, 273.h, 31),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                      _difficultyProvider.setIndex(DifficultyIndex.none);
                    },
                    child: Container(
                      width: 579.w,
                      height: 273.h,
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        Asset.imagePath("btn_back_tab.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50.h),
                child: RubyText([
                  RubyTextData(
                    "難易度",
                    ruby: "なんいど",
                    style: TextStyle(
                        fontFamily: "NotoSansMonoCJKjp",
                        fontWeight: FontWeight.w600,
                        fontSize: 130.sp,
                        height: 1.2,
                        color: Colors.white),
                    rubyStyle: TextStyle(
                        fontFamily: "NotoSansMonoCJKjp",
                        fontWeight: FontWeight.w300,
                        fontSize: 56.sp),
                  ),
                  RubyTextData(
                    "を選んでください",
                    style: TextStyle(
                        fontFamily: "NotoSansMonoCJKjp",
                        fontWeight: FontWeight.w600,
                        fontSize: 130.sp,
                        height: 1.2,
                        color: Colors.white),
                  )
                ]),
              ),
              Container(
                width: double.infinity,
                height: 455.h,
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: (864.w - util.parallelogramOffset(455.h, 30) + 10.w) *
                        0,
                    width: 864.w,
                    height: 455.h,
                    child: ClipPath(
                        clipper: ParallelogramClipper(
                            864.w, 455.h, util.parallelogramOffset(455.h, 30)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _difficultyProvider.setIndex(DifficultyIndex.easy);
                          },
                          child: Stack(children: [
                            Container(
                              width: 864.w,
                              height: 455.h,
                              child: Image.asset(
                                Asset.imagePath(_difficultyProvider.index ==
                                        DifficultyIndex.easy
                                    ? "btn_difficulty_ON_tab.png"
                                    : "btn_difficulty_default_tab.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                                child: Container(
                              padding:
                                  EdgeInsets.only(top: 100.h, bottom: 100.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      height: 190.h,
                                      child: Image.asset(Asset.imagePath(
                                          "text_difficulty_e_tab.png"))),
                                  Text(
                                    "初めての方向け",
                                    style: TextStyle(
                                        fontFamily: "NotoSansMonoCJKjp",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 40.sp,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ))
                          ]),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    left: (864.w - util.parallelogramOffset(455.h, 30) + 10.w) *
                        1,
                    width: 864.w,
                    height: 455.h,
                    child: ClipPath(
                        clipper: ParallelogramClipper(
                            864.w, 455.h, util.parallelogramOffset(455.h, 30)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _difficultyProvider
                                .setIndex(DifficultyIndex.normal);
                          },
                          child: Stack(children: [
                            Container(
                              width: 864.w,
                              height: 455.h,
                              child: Image.asset(
                                Asset.imagePath(_difficultyProvider.index ==
                                        DifficultyIndex.normal
                                    ? "btn_difficulty_ON_tab.png"
                                    : "btn_difficulty_default_tab.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                                child: Container(
                                  padding:
                                  EdgeInsets.only(top: 100.h, bottom: 100.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          height: 190.h,
                                          child: Image.asset(Asset.imagePath(
                                              "text_difficulty_n_tab.png"))),
                                      Text(
                                        "オススメの標準的な難易度",
                                        style: TextStyle(
                                            fontFamily: "NotoSansMonoCJKjp",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 40.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ))
                          ]),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    left: (864.w - util.parallelogramOffset(455.h, 30) + 10.w) *
                        2,
                    width: 864.w,
                    height: 455.h,
                    child: ClipPath(
                        clipper: ParallelogramClipper(
                            864.w, 455.h, util.parallelogramOffset(455.h, 30)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _difficultyProvider.setIndex(DifficultyIndex.hard);
                          },
                          child: Stack(children: [
                            Container(
                              width: 864.w,
                              height: 455.h,
                              child: Image.asset(
                                Asset.imagePath(_difficultyProvider.index ==
                                        DifficultyIndex.hard
                                    ? "btn_difficulty_ON_tab.png"
                                    : "btn_difficulty_default_tab.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                                child: Container(
                                  padding:
                                  EdgeInsets.only(top: 100.h, bottom: 100.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          height: 190.h,
                                          child: Image.asset(Asset.imagePath(
                                              "text_difficulty_h_tab.png"))),
                                      Text(
                                        "慣れてきたらこちら",
                                        style: TextStyle(
                                            fontFamily: "NotoSansMonoCJKjp",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 40.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ))
                          ]),
                        )),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 50.h),
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                      clipper: ParallelogramClipper(
                          801.w, 285.h, util.parallelogramOffset(285.h, 30)),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: _difficultyProvider.index == DifficultyIndex.none
                            ? null
                            : () {
                                pageViewModel
                                    .navigateNextPage(Consts.pathTutorial);
                                _oscModelProvider
                                    .oscPageSend(PageIndex.tutorial);
                                _oscModelProvider.oscDifficultySend(
                                    _difficultyProvider.index);
                                _difficultyProvider.reset();
                              },
                        child: Container(
                          width: 801.w,
                          height: 285.h,
                          child: Image.asset(
                            Asset.imagePath(_difficultyProvider.index ==
                                    DifficultyIndex.none
                                ? "btn_decide_disabled_tab.png"
                                : "btn_decide_tab.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
