import 'dart:core';
import 'package:device_info/device_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/list_page.dart';
import 'package:soldier_realtime_phone_return/userManger/userManager.dart';

class CustomData extends StatefulWidget {
  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  String userName;
  final test = UnitCode();
  final referenceDatabase = FirebaseDatabase.instance; // firebase
  final testName = "userName"; // 테스트이름
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference().child("300124"); //내 firebase 참조
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("TestFireBase"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<AndroidDeviceInfo>(
                future: deviceInfoPlugin.androidInfo,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  AndroidDeviceInfo deviceInfo = snapshot.data; // device 정보들
                  return Center(
                    child: Container(
                      color: Colors.white30,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Text(
                            testName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            onChanged: (val) {
                              userName = val;
                            },
                            decoration: InputDecoration(
                              hintText: "사용자 명",
                              labelText: "이름을 입력하세요",
                              labelStyle: TextStyle(color: Colors.lightBlue),
                              filled: true,
                              icon: new Icon(Icons.person),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          FlatButton(
                            color: Colors.black54,
                            onPressed: () {
                              ref.child(deviceInfo.androidId) // 기기ID 노드\
                                  .set({
                                "userName": userName,
                                "status": "off",
                              }); // add 사용자 이름
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ListPage()),
                              // );
                            },
                            child: Text("Test"),
                            textColor: Colors.white,
                          ),
                          RaisedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()),);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
