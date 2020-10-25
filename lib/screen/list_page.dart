import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("제출리스트"),
      ),
      body: Container(
        child: Text("ListPage"),
      ),
    );
  }
}
