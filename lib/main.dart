import 'package:flutter/material.dart';
import 'package:weather/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'weather forecast',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
