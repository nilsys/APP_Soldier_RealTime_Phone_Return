import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final deviceController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return Scaffold(
      appBar: AppBar(
        title: Text("device-info"),
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<AndroidDeviceInfo>(
            future: deviceInfo.androidInfo,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                AndroidDeviceInfo info = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: deviceController,
                        initialValue: info.androidId,
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone_android)),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.face), labelText: "이름"),
                        validator: (value) =>
                        value.isEmpty ? '이름을 입력하세요.' : null,
                      ),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}