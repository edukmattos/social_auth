import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ButtonRaisedWidget(
  {
    String text,
    Color textColor,
    Color buttonColor,
    Function() onPressed,    
    IconData icon
  }
  ) {
      return RaisedButton(
        child: Text(text, 
          style: TextStyle(color: textColor)
        ),
        color: buttonColor,
        onPressed: onPressed,
      );
    }