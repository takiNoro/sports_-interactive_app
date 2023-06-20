import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_interactive_app/Util/PageViewModel.dart';
import 'package:sports_interactive_app/Util/util.dart';
import 'package:sports_interactive_app/osc/osc.dart';

class BasePage extends ConsumerWidget {
  Util util = Util();
  PageViewModel pageViewModel = PageViewModel();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }

}