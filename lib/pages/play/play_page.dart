import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_interactive_app/model/page_model.dart';

import '../../asset.dart';
import '../../customColor.dart';
import '../../osc/osc.dart';
import '../base_page.dart';
import '../score/score_page.dart';

class PlayPage extends BasePage {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _oscModelProvider = ref.watch(oscModelProvider);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: CustomColor.tutorialBack,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        width: 1295.w,
                        height: 425.h,
                        child:
                            Image.asset(Asset.imagePath("img_look_2_tab.png"))),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
