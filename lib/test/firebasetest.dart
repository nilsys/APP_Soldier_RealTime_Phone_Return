import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:soldier_realtime_phone_return/screen/list_page.dart';

class CustomData extends StatefulWidget {
  CustomData({this.app});
  final FirebaseApp app;

  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  final referenceDatabase = FirebaseDatabase.instance; // firebase
  final testName = "testName"; // 테스트이름
  final testController = TextEditingController();
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference(); //내 firebase 참조
    return Scaffold(
      appBar : AppBar(
        automaticallyImplyLeading: false,
        title: Text("TestFireBase"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder<AndroidDeviceInfo>(
              future: deviceInfoPlugin.androidInfo,
              builder: (BuildContext context, AsyncSnapshot snapshot){
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
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: testController,
                          textAlign: TextAlign.center,
                        ),
                        FlatButton(
                          color: Colors.black54,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListPage()),
                            );
                          //   ref
                          //       .child(deviceInfo.androidId) // 기기ID 노드
                          //       .child(testName) // 기기 사용자 노드
                          //       .set(testController.text) // add 사용자 이름
                          //       .asStream(); //done
                          },
                          child: Text(
                              "Test"
                          ),textColor: Colors.white,),
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
