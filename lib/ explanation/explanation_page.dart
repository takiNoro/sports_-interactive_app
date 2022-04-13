import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mode_select/mode_select_page.dart';

class ExplanationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("説明ページ"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100, bottom: 50),
                  child: Text(
                    "スポーツインタラクティブについて",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 150),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "説明1 ~~~~~~~~~~",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "説明2 ~~~~~~~~~~",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "説明3 ~~~~~~~~~~",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "説明4 ~~~~~~~~~~",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "説明5 ~~~~~~~~~~",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      Visibility(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 30),
                            child: SizedBox(width: 150, height: 48),
                          ),
                        ),
                        visible: true,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 400,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO UDPでつぎに
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ModeSelectPage()));
                              },
                              child: Text("つぎへ"),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.only(right: 30),
                          child: SizedBox(
                            width: 150,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO わからん
                              },
                              child: Text("すきっぷ？"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
