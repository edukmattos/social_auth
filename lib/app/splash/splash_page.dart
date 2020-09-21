import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:social_auth/app/modules/shared/auth/auth_controller.dart';
import 'package:social_auth/enums/auth_status_enum.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final authController = Modular.get<AuthController>();
      if (authController.authStatusEnum == AuthStatusEnum.successful) {
        Modular.to.pushReplacementNamed('/home');
      } else if (authController.authStatusEnum == AuthStatusEnum.signOut) {
        Modular.to.pushReplacementNamed('/auth/login');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
