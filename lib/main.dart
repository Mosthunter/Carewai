import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() {
  runApp(MyApp());
}
//aaa
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
