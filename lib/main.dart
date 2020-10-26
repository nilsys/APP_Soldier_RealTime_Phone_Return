import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/first_page.dart';
import 'package:soldier_realtime_phone_return/test/firebasetest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
