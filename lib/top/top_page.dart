import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ explanation/explanation_page.dart';

class TopPage extends ConsumerStatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  TopPageState createState() => TopPageState();
}

class TopPageState extends ConsumerState<TopPage> {
  @override
  void initState() {
    // TODO ここでsocktをコネクトさせておくかも？
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("top page"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "~~~~~~タイトル~~~~~",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    height: 50,
                    width: 600,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO 画面遷移
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ExplanationPage()));
                        // TODO UDP通信で遷移したことを通知させる(スーパークラスに処理書いた方がよいかも)
                      },
                      child: Text("スタート！"),
                    ),
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
