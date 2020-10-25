import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //container
              Stack(
                children: <Widget>[
                  checkForm(context),
                  loginButton(context),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                },
              ),
              Container(
                height: size.height * 0.05,
              ),
              Text("Test App"),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: RaisedButton(
        child: Text(
          '확인',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: (){
        },
      ),
    );
  }

  Widget checkForm(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            labelText: "부대코드"),
                        validator: (value) =>
                        value.isEmpty ? '부대코드를 입력하세요.' : null,
                      ),
                    ],
                  ),),
          ),
        ));
  }
}