import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/test/TestClass.dart';

class ListPage extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListPage> {
  final testFirebase = FirebaseDatabase.instance.reference().child("300124");
  List<Test> testList = List();

  @override
  void initState() {
    super.initState();
    testFirebase.once().then((DataSnapshot snap) {
      var data = snap.value;
      testList.clear();
      data.forEach((key, value) {
        Test model = new Test(
          userName: value['userName'],
          status: value['status'],
          key: value['key'],
        );
        print(key);
        testList.add(model);
      });
      setState(() {});
    });
  }

  // Future<String> createDialog(BuildContext context) {
  //   TextEditingController changeName = TextEditingController();
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text("Change"),
  //           content: TextField(
  //             controller: changeName,
  //           ),
  //           actions: <Widget>[
  //             MaterialButton(
  //               onPressed: () {
  //                 print("hello");
  //                 Navigator.of(context).pop(changeName.text.toString());
  //               },
  //               child: Text("change"),
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    Widget UI(String userName, String status, String idKey) {
      return new GestureDetector(
        onLongPress: () {},
        onTap: () {
          print(userName);
          print(idKey);
          testFirebase.child("23523523235").update({"status":"on"});
          // createDialog(context).then((value) {
          //   if (value != null) {
          //     print("nonull");
          //     Map<String, Object> createDoc = new HashMap();
          //     createDoc['userName'] = value;
          //     fb.child(key).update(createDoc);
          //   }
          //});
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: userName,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                      ),
                    )
                  ]))),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: status,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17,
                        ),
                      )
                    ]),
                  ),
                  Text(
                    "idKey 주석"//idKey
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("리스트"),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child: testList.length == 0
            ? Text("ㄴ")
            : new ListView.builder(
                itemCount: testList.length,
                itemBuilder: (_, index) {
                  return UI(testList[index].userName, testList[index].status,
                      testList[index].key);
                },
              ),
      ),
    );
  }
}
