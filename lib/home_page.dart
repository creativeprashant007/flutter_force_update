import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Theme,
        Widget;

import 'package:upgrader/upgrader.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cfg = AppcastConfiguration(
      url:
          "https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml",
      supportedOS: ['android']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: UpgradeAlert(
          upgrader: Upgrader(
              dialogStyle: UpgradeDialogStyle.cupertino, appcastConfig: cfg),
          child: Center(child: Text('Checking...')),
        ));
  }
}
