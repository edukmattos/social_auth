import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/drawer/drawer_navigation_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(
        //  icon: Icon(Icons.logout),
        //  onPressed: controller.homeCtrlSignOut,
        //),
        title: Text(widget.title),
        actions: [
          Observer(
            builder: (_) {
              return Switch(
                value: controller.appController.isDark,
                onChanged: (bool value) {
                  controller.appController.appCtrlThemeSwitch();
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
      drawer: DrawerNavigationWidget(),
    );
  }
}
