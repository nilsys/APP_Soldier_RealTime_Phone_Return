import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/login_page.dart';

class passwordFindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("비밀번호 찾기"),
      ),
    );
  }
}
