import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/test/firebasetest.dart';
import 'package:soldier_realtime_phone_return/userManger/userManager.dart';

class FirstPage extends StatelessWidget {
  const FirstPage();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
          title: Text("부대코드")),
      body: const SignUpFormField(),
    );
  }
}

class SignUpFormField extends StatefulWidget {
  const SignUpFormField({Key key}) : super(key: key);

  @override
  SignUpFormFieldState createState() => SignUpFormFieldState();
}


class SignUpFormFieldState extends State<SignUpFormField> {
  final unitCodeController = TextEditingController();
  final unitCode = FirebaseDatabase.instance.reference();
  final test = UnitCode();

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
              TextFormField(
                //userName
                controller: unitCodeController,
                decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.accessibility_new),
                    labelText: "부대코드"),
              ),
              sizedBoxSpace,
              Center(
                child: Column(children: [
                  RaisedButton(
                    child: Text("제출"),
                    onPressed: () {
                      unitCode
                          .orderByKey()
                          .equalTo(unitCodeController.text)
                          .once()
                          .then((DataSnapshot snapshot) {
                        if (snapshot.value != null) {
                          test.unitSet = Unit(code:unitCodeController.text);
                          print(test.unitGet.code);
                          print("success");
                        } else {
                          print("fail");
                        }
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomData()),
                      );
                    },
                  ),
                ]),
              ),
              sizedBoxSpace,
              StreamBuilder(
                  stream: unitCode.child("3000").onValue,
                  builder: (context, AsyncSnapshot<Event> snap) {
                    if (!snap.hasData) return Text("try");
                    return Column(
                      children: [
                        Text(""),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
