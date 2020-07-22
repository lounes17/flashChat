import 'package:flash_chat/components/rounde_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id ="login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String email;
  String password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType:TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration: KInputDecoration.copyWith(hintText: "Entre your email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration: KInputDecoration.copyWith(hintText: "Entre your password"),

              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(coulour: Colors.lightBlueAccent,onPressed:  ()async {
                //Implement registration functionality.
                try{
                  setState(() {
                    _saving=true;
                  });
                  final singin=await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(singin != null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    _saving=false;
                  });
                }catch(e){
                  print(e);
                }
              },title: "Log In",)
            ],
          ),
        ),
        inAsyncCall: _saving,

      ),
    );
  }
}
