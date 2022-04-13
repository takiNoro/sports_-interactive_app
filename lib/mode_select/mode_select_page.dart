import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mode_select_view_model.dart';

class ModeSelectPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _modeSelectModelProvider = ref.watch(modeSelectModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("モード選択"),
      ),
      body: SafeArea(
        child: Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 100),
                  child: Center(child: Text("モードを選択", style: TextStyle(fontSize: 50),),),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 400,
                          height: 500,
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              children: [
                                Text("aaaaaaaaaaaa"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 400,
                          height: 500,
                          child: Container(
                            color: Colors.red,
                            child: Column(
                              children: [
                                Text("aaaaaaaaaaaa"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text("aaaaa"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
