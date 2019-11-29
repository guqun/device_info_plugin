import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info_plugin/device_info_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, String> _platformInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Map<String, String> platformInfo = new Map();
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Map<dynamic, dynamic> platformInfoTmp = await DTPlaformInfoPlugin.dtPlaformInfoPlugin;
      platformInfoTmp.forEach((key, value){
        platformInfo.putIfAbsent(key, ()=>value);
      });
    } on PlatformException {
      platformInfo = Map();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformInfo = platformInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: \n' + _platformInfo.toString()),
        ),
      ),
    );
  }
}
