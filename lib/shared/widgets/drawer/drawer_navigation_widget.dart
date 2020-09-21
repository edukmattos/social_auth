import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'drawer_body_item_widget.dart';
import 'drawer_header_widget.dart';

class DrawerNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderWidget(),
          DrawerBodyItemWidget(
            icon: Icons.home,
            text: 'Materiais',
            onTap: () => Modular.to.pushReplacementNamed('/material/dashboard')),
           
          DrawerBodyItemWidget(
            icon: Icons.home,
            text: 'Clientes',
            onTap: () => Modular.to.pushReplacementNamed('/client/list')),

          DrawerBodyItemWidget(
            icon: Icons.event_note,text: 'Events'),
          Divider(),
          DrawerBodyItemWidget(
            icon: Icons.notifications_active,text: 'Notifications'),
          DrawerBodyItemWidget(
            icon: Icons.contact_phone,text: 'Contact Info'),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
          Expanded(
           child: new Align(
             alignment: Alignment.bottomCenter,
               child: new Text('App version 1.0.0'),
             )
          ) ,
        ],
      ),
   );
 }
}