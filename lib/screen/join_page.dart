import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/login_page.dart';

class JoinPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

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
                  loginButton(context),
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

  void _register(BuildContext context) async {
    final UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: eMailController.text, password: pwController.text);
    final User user = result.user;

    if(user == null){
      final _snackBar = SnackBar(content: Text("try"),);
      Scaffold.of(context).showSnackBar(_snackBar);
    }

    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPage(email: user.email)));
    // 조인 후 바로 리스트 창으로 이동
  }

  Widget loginButton(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
          onPressed: (){
            if (formKey.currentState.validate()) _register(context);
          }
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
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: eMailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle), labelText: "이메일"),
                        validator: (value) =>
                        value.isEmpty ? '이메일을 입력하세요.' : null,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: pwController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "패스워드"),
                        validator: (value) =>
                        value.isEmpty ? '패스워드를 입력하세요.' : null,
                      ),
                    ],
                  ))),
        ));
  }
}
