import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'example/features.dart';


// class ExampleApp extends StatefulWidget {
//   const ExampleApp({Key? key}) : super(key: key);
//
//   @override
//   _ExampleAppState createState() => _ExampleAppState();
// }
//
// class _ExampleAppState extends State<ExampleApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

void main() {
  HttpOverrides.global = MyHttpOverrides_SSL();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Select',
      home: Features(),
    );
  }
}

class MyHttpOverrides_SSL extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}