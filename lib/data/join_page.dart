import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/login_page.dart';

class JoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //container
              Stack(
                children: <Widget>[
                  loginForm(size),
                  loginButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: RaisedButton(
          child: Text(
            '회원가입',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: (){}
      ),
    );
  }

  Widget loginForm(Size size) {
    return Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 12, bottom: 32),
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "이름"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "이메일"),
                        validator: (value) =>
                        value.isEmpty ? '패스워드를 입력하세요.' : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "패스워드"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "생년월일"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "전화번호"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "입대일자"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "전역일자"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                    ],
                  ))),
        ));
  }
}
