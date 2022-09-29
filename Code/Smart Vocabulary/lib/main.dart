import 'package:dictionary/UI/Home_Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Vocabulary',
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}
