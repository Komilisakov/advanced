import 'package:advanced/pages/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Get version and Package'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _projectVersion = '';
  String _appName = '';
  String _buildNumber = '';
  String _packageName = '';
  String _version = '';

  int _counter = 0;
@override
  void initState() {
  print("initState()");
    // TODO: implement initState
  _initPlatformState();
  super.initState();

  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:HomePage(),
      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //        Text(
      //             "version= ${_version.toString()} \n"
      //             "packageName= ${_packageName.toString()}",
      //          style: TextStyle(fontSize: 18),
      //       ),
      //       Text(
      //         '$_projectVersion',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _initPlatformState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    setState(() {
      _buildNumber = buildNumber;
      _appName = appName;
      _packageName = packageName;
      _version = version;
    });
}
}
