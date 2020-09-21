import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app/modules/shared/auth/repositories/auth_repository.dart';

// ignore: non_constant_identifier_names
Widget DrawerHeaderWidget() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Eduardo Mattos'),
          accountEmail: Text('edukmattos@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Text('EM'),
          ),
          otherAccountsPictures: <Widget>[
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {},
              child: Icon(Icons.games),
            ),
            IconButton(
              icon: Icon(Icons.games),
              tooltip: 'Sair',
              onPressed: () {
                Modular.get<AuthRepository>().authRepoSignOut();
                Modular.to.pushReplacementNamed('/auth/login');
              },
            ),
            GestureDetector(
              onTap: () {
                Modular.get<AuthRepository>().authRepoSignOut();
                Modular.to.pushReplacementNamed('/auth/login');
              },
              child: CircleAvatar(
                child: Text('EM'),
              ),
            ),
          ],
        ),
      ]));
}
