import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_interactive_app/admin/admin_view_model.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends ConsumerState<AdminPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _adminModelProvider = ref.watch(adminModelProvider);
    _adminModelProvider.setUp();
    return Scaffold(
      appBar: AppBar(
        title: Text("setting_page"),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _createForm(oscProperty.values),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(onPressed: () {
              try{
                _adminModelProvider.save();
              } catch(e) {
                showDialog(context: context, builder: (_) {
                  return AlertDialog(
                    title: Text(e.toString()),
                  );
                });

              }
            }, child: Text("保存"))),
      ),
    );
  }

  Widget _createForm(List<oscProperty> property) {
    List<Widget> _listWidget = [];
    property.forEach((element) {
      _listWidget.add(_createList(element));
    });

    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(
          children: _listWidget,
        ));
  }

  Widget _createList(oscProperty property) {
    final _ref = ref.watch(adminModelProvider);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          _ref.settingList[property.index],
          style: TextStyle(fontSize: 18),
        ),
      ),
      SizedBox(height: 10),
      _createTextField(property)
    ]);
  }

  Widget _createTextField(oscProperty property) {
    final _ref = ref.watch(adminModelProvider);
    switch (property) {
      case oscProperty.sendPort:
        return _createPortForm(_ref.oscSendPortController);
      case oscProperty.receivePort:
        return _createPortForm(_ref.oscReceivePortController);
      case oscProperty.sendDomain:
        return _createDomainForm(_ref.oscSendDomainController);
      case oscProperty.receiveDomain:
        return _createDomainForm(_ref.oscReceiveDomainController);
      case oscProperty.ipAddress:
        return _createIPForm();
    }
  }

  Widget _createPortForm(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _createDomainForm(TextEditingController controller) {
    return Row(
      children: [
        Text(
          "/",
          style: TextStyle(fontSize: 30),textAlign: TextAlign.end,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.text,
            // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createIPForm() {
    final _ref = ref.watch(adminModelProvider);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _ref.oscIPController1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Text(
          ".",
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: TextFormField(
            controller: _ref.oscIPController2,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Text(
          ".",
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: TextFormField(
            controller: _ref.oscIPController3,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Text(
          ".",
          style: TextStyle(fontSize: 30),
        ),
        Expanded(
          child: TextFormField(
            controller: _ref.oscIPController4,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
