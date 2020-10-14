import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {

  ListPage({this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email"),
      ),
      body: Container(
        child: Center(
          child: FlatButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, child: Text("back"),),
        ),
      ),
    );
  }
}
