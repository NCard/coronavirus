import 'package:flutter/material.dart';
import 'package:home_app/widget/home/homeWidget.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prectice',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}