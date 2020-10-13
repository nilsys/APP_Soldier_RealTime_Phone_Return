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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key), labelText: "변경할 패스워드 입력"),
                validator: (value) =>
                value.isEmpty ? '패스워드를 입력하세요.' : null,
              ),
              Positioned(
                left: size.width * 0.15,
                right: size.width * 0.15,
                bottom: 0,
                child: RaisedButton(
                  child: Text(
                    '비밀번호 변경',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  onPressed: (){},
                ),
              ),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
