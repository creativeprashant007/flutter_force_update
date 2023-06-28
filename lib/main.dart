import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        ColorScheme,
        Colors,
        MaterialApp,
        Scaffold,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        Theme,
        ThemeData,
        Widget,
        runApp;
import 'package:upgrader/upgrader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '`Force Upgrade',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Force Upgrade'),
    );
  }
}

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
