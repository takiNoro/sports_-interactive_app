import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sports_interactive_app/pages/difficulty_select/difficulty_page.dart';
import 'package:sports_interactive_app/pages/play/play_page.dart';
import 'package:sports_interactive_app/pages/ranking/ranking_page.dart';
import 'package:sports_interactive_app/pages/score/score_page.dart';
import 'package:sports_interactive_app/pages/top/top_page.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:sports_interactive_app/pages/tutorial/tutorial_page.dart';

import 'Util/NavigationService.dart';
import 'const.dart';
import 'model/page_model.dart';
import 'osc/osc.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

void main() async {
  // load();
  // var ipifyApiKeyName = 'IPIFY_API_KEY';
  // var IPIFY_API_KEY =
  // env.containsKey(ipifyApiKeyName) ? env[ipifyApiKeyName] : '';
  //
  // final ip = await Ipify.ipv64(format: Format.JSON);
  // print(ip);

  // final myGeo = await Ipify.geo(IPIFY_API_KEY.toString());
  // print(myGeo.location);
  //
  // final someGeo = await Ipify.geo(IPIFY_API_KEY.toString(), ip: '8.8.8.8');
  // print(someGeo);
  //
  // final balance = await Ipify.balance(IPIFY_API_KEY.toString());
  // print(balance);
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,//縦固定
  ]);
  setupLocator();
  runApp(
      ProviderScope(
          child: ScreenUtilInit(
            designSize: Size(Consts.designWidth, Consts.designHeight),
            child: MyApp()
          )
          // child: MyApp()
      )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _oscModelProvider = ref.watch(oscModelProvider);
    _oscModelProvider.oscReceive();
    WidgetsFlutterBinding.ensureInitialized();
    //向き指定
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'sports_interactive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      routes: {
        "/top": (context) => TopPage(),
        "/difficulty": (context) => DifficultyPage(),
        "/tutorial": (context) => TutorialPage(),
        "/play": (context) => PlayPage(),
        "/score": (context) => ScorePage(),
        "/rank": (context) => RankingPage(),
      },
      initialRoute: "/top",
    );
  }
}