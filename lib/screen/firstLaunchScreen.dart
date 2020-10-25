import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soldier_realtime_phone_return/screen/list_page.dart';

class FirstLaunchAppPage extends StatelessWidget {
  const FirstLaunchAppPage();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("정보기입")
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

class UserData {
  String userName = '';
  String userMilSerialNum = '';
  String userMilClass = '이병';
  int userUnitSerialNum = 0;
}

class SignUpFormFieldState extends State<SignUpFormField>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _classes = ["이병", "일병", "상병", "병장", "부사관", "장교"];

  UserData user = UserData();

  void showInSnackBar(String SnackbarValue){
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(SnackbarValue),));
  }

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userMilSerialNumFormatter _userMilSerialNumFormat = _userMilSerialNumFormatter();

  void _handleSubmitted(){
    final form = _formKey.currentState;
    if(!form.validate()){
      _autovalidateMode = AutovalidateMode.always;
      showInSnackBar("미입력 항목 존재");
    }else{
      form.save();
      //only for text
      showInSnackBar("이름:${user.userName}  군번:${user.userMilSerialNum}  계급:${user.userMilClass}");
      //todo
    }
  }

  String _validateUserName(String value){
    if(value.isEmpty){
      return "이름을 입력하세요";
    }
    return null;
  }

  String _validateMilSerialNum(String value){
    final milSerialNumExpression = RegExp(r"^\d\d\-\d\d\d\d\d\d\d\d$");
    if(!milSerialNumExpression.hasMatch(value)){
      return "(##)-(########) 군번을 입력하세요";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
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
                        hintText: "ex)홍길동",
                        labelText: "이름"
                    ),
                    onSaved: (value){
                      user.userName = value;
                    },
                    validator: _validateUserName,
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        icon: const Icon(Icons.account_box),
                        hintText: "##-########",
                        labelText: "군번"
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value){
                      user.userMilSerialNum = value;
                    },
                    maxLength: 11,
                    maxLengthEnforced: true,
                    validator: _validateMilSerialNum,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, _userMilSerialNumFormatter(),
                    ],
                  ),
                  sizedBoxSpace,
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        filled: true,
                        icon: const Icon(Icons.badge),
                        labelText: "계급",
                        hintText: "계급을 선택하세요"
                    ),
                    value: user.userMilClass,
                    onChanged: (String newValue){
                      setState((){
                        user.userMilClass = newValue;
                      });
                    },
                    items: _classes.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  //todomultileveldropdown으로 부대 선택하기
                  sizedBoxSpace,
                  Center(
                    child: RaisedButton(
                      child: Text("제출"),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ListPage()));
                      },
                    ),
                  ),
                  sizedBoxSpace
                ],
              ),
            ),
          ),
        )
    );
  }
}

class _userMilSerialNumFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue){
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if(newTextLength >= 3){
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + '-');
      if(newValue.selection.end >= 2) selectionIndex++;
    }
    if(newTextLength >= usedSubstringIndex){
      newText.write(newValue.text.substring((usedSubstringIndex)));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection:  TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
