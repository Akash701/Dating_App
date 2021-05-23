import 'package:flutter/material.dart';
import 'package:closer/Map/geolocation.dart';
import 'package:closer/Search.dart';
import 'package:closer/Chat/chatPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Chat(),
    );
  }
}
