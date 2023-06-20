import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_interactive_app/local_storage/local_storage.dart';

import '../const.dart';

enum oscProperty {
  ipAddress,
  sendPort,
  sendDomain,
  receivePort,
  receiveDomain,
}

final adminModelProvider = ChangeNotifierProvider((ref) => AdminModel());



class AdminModel extends ChangeNotifier {
  List<String> settingList = ["IPアドレス", "OSCの送信で使うポート","OSCの送信で使うドメイン","OSCの受信で使うポート","OSCの受信で使うドメイン"];
  TextEditingController oscIPController1 = TextEditingController();
  TextEditingController oscIPController2 = TextEditingController();
  TextEditingController oscIPController3 = TextEditingController();
  TextEditingController oscIPController4 = TextEditingController();
  TextEditingController oscSendPortController = TextEditingController();
  TextEditingController oscSendDomainController = TextEditingController();
  TextEditingController oscReceivePortController = TextEditingController();
  TextEditingController oscReceiveDomainController = TextEditingController();

  Future<void> setUp() async {
    final prefs = await SharedPreferences.getInstance();

    final String _ip = prefs.getString(StorageKey.ip.name) ?? "192.168.137.1";
    final int _sendPort = prefs.getInt(StorageKey.sendPort.name) ?? Consts.sendPort;
    final String _sendDomain = prefs.getString(StorageKey.sendDomain.name) ?? Consts.sendDomain;
    final int _receivePort = prefs.getInt(StorageKey.receivePort.name) ?? Consts.receivePort;
    final String _receiveDomain = prefs.getString(StorageKey.receiveDomain.name) ?? Consts.receiveDomain;

    oscSendPortController.text = _sendPort.toString();
    oscSendDomainController.text = _sendDomain.substring(1);
    oscReceivePortController.text = _receivePort.toString();
    oscReceiveDomainController.text = _receiveDomain.substring(1);
  }

  void save()  {
    bool validation = false;
    String error = "";
    if (validationIP()){
      if (error.isNotEmpty) {error += "\n";}
      error += "IPがおかしいです";
    }
    if (validationSendDomain()){
      if (error.isNotEmpty) {error += "\n";}
      error += "sendDomainがおかしいです";
    }
    if (validationReceiveDomain()){
      if (error.isNotEmpty) {error += "\n";}
      error += "ReceiveDomainがおかしいです";
    }
    if (validationSendPort()){
      if (error.isNotEmpty) {error += "\n";}
      error += "SendPortがおかしいです";
    }
    if (validationReceiveDomain()){
      if (error.isNotEmpty) {error += "\n";}
      error += "ReceiveDomainがおかしいです";
    }
    if (error.isNotEmpty) {
      throw error;
    } else {
      LocalStorage().increment(StorageKey.ip, "${oscIPController1.text}.${oscIPController2.text}.${oscIPController3.text}.${oscIPController4.text}");
      LocalStorage().increment(StorageKey.sendPort, oscSendPortController.text);
      LocalStorage().increment(StorageKey.receivePort, oscReceivePortController.text);
      LocalStorage().increment(StorageKey.sendDomain, "/${oscSendDomainController.text}");
      LocalStorage().increment(StorageKey.receiveDomain, "/${oscReceiveDomainController.text}");
    }
  }

  bool validationIP() {
    return oscIPController1.text.isEmpty || oscIPController2.text.isEmpty || oscIPController3.text.isEmpty || oscIPController4.text.isEmpty;
  }
  bool validationSendDomain() {
    return oscSendDomainController.text.isEmpty;
  }
  bool validationReceiveDomain() {
    return oscReceiveDomainController.text.isEmpty;
  }
  bool validationSendPort() {
    return oscSendPortController.text.isEmpty;
  }
  bool validationReceivePort() {
    return oscReceivePortController.text.isEmpty;
  }

}
