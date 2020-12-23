import 'package:flutter/material.dart';
import 'package:flutter_boost_sweets/tab_bar_screen.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabBarScreen(),
    );
  }
}