import 'package:flash_chat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounde_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id ="registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String password,email;
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
                decoration: KInputDecoration.copyWith(hintText: "Entre your Email"),
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
              RoundedButton(coulour: Colors.blueAccent,title: "Register",onPressed:  () async {
                //Implement registration functionality.
                setState(() {
                  _saving=true;
                });
                try{
                  final  useregister= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(useregister != null){
                    Navigator.pushNamed(context,ChatScreen.id);
                  }
                  setState(() {
                    _saving=false;
                  });

                }catch(e){
                  print(e);
                }

              },)
            ],
          ),
        ),
          inAsyncCall: _saving,
      ),
    );
  }
}
