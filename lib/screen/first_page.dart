import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/test/firebasetest.dart';

class FirstPage extends StatelessWidget {
  const FirstPage();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          title: Text("부대코드")
      ),
      body: const SignUpFormField(),
    );
  }
}

class SignUpFormField extends StatefulWidget{
  const SignUpFormField({Key key}) : super(key: key);

  @override
  SignUpFormFieldState createState() => SignUpFormFieldState();
}

class SignUpFormFieldState extends State<SignUpFormField>{
  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);
    return Scaffold(
        body: Form(
          child: Scrollbar(
            child: SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  sizedBoxSpace,
                  TextFormField( //userName
                    decoration: InputDecoration(
                        filled: true,
                        icon: const Icon(Icons.accessibility_new),
                        labelText: "부대코드"
                    ),
                  ),
                  sizedBoxSpace,
                  Center(
                    child: RaisedButton(
                      child: Text("제출"),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CustomData()),
                        );
                      },
                    ),
                  ),
                  sizedBoxSpace,
                ],
              ),
            ),
          ),
        )
    );
  }
}
