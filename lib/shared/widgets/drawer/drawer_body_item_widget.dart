import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget DrawerBodyItemWidget(
   {IconData icon, String text, GestureTapCallback onTap}) {
 return ListTile(
   title: Row(
     children: <Widget>[
       Icon(icon),
       Padding(
         padding: EdgeInsets.only(left: 8.0),
         child: Text(text),
       )
     ],
   ),
   trailing: Icon(Icons.arrow_right),
   onTap: onTap,
 );
}