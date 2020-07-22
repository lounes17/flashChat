import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Color coulour;
  final String title;
  RoundedButton({@required this.coulour,@required this.onPressed,@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: coulour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,style: TextStyle(color: Colors.white),
          ),

        ),
      ),
    );
  }
}
