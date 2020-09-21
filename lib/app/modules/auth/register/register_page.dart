import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_auth/app/config/app_config.dart';
import 'package:social_auth/app/config/constants.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const RegisterPage(
      {Key key,
      this.title = appPageTagAuthRegister,
      this.subtitle = appPageTagFunctionSearch})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  var _formKey = GlobalKey<FormState>();

  @override
  bool _rememberMe = false;
  bool _submmiting = false;

  Widget _buildAuthLogo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60.0,
      //backgroundImage: AssetImage(appLogoImgPath),
    );
  }

  Widget _buildNameTF() {
    return Observer(
      name: 'observerName',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changeName,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: 'Nome',
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.face,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validateName() == null
                          ? null
                          : Text(
                              controller.validateName(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmailTF() {
    return Observer(
      name: 'observerEmail',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changeEmail,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: 'E-mail',
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validateEmail() == null
                          ? null
                          : Text(
                              controller.validateEmail(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordTF() {
    return Observer(
      name: 'observerPassord',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changePassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: 'Senha',
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validatePassword() == null
                          ? null
                          : Text(
                              controller.validatePassword(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordConfirmTF() {
    return Observer(
      name: 'observerPassord',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changePasswordConfirm,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: 'Confirmar Senha',
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validatePasswordConfirm() == null
                          ? null
                          : Text(
                              controller.validatePasswordConfirm(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRegisterBtn() {
    return Observer(
        name: 'submitButtonObserver',
        builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: controller.isFormValid
                  ? () async {
                      var result =
                          await controller.registerCtrlEmailPasswordSignUp(
                        controller.email,
                        controller.password,
                      );
                      print("result: $result");
                      if (result == null) {
                        Modular.to.pushReplacementNamed('/home');
                      } else {
                        _flushBar();
                        //Modular.to.pushReplacementNamed('/auth');
                      }
                    }
                  : null,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                !_submmiting ? 'LOGIN' : 'Verificando ...',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          );
        });
  }

  Widget _flushBar() {
    return Flushbar(
      title: controller.errorTitle,
      message: controller.errorMsg,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      //showProgressIndicator: true,
      //progressIndicatorController: controller.errorMsg,
      //progressIndicatorBackgroundColor: Colors.grey[800],
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.error_outline,
        size: 30.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title),
          Visibility(
            visible: true,
            child: Text(
              widget.subtitle,
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Form(
        key: _formKey,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin,
                      vertical: kDefaultPaddin,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Text(
                        //  'Autenticação',
                        //  style: TextStyle(
                        //    color: Colors.white,
                        //    fontFamily: 'OpenSans',
                        //    fontSize: 30.0,
                        //    fontWeight: FontWeight.bold,
                        //  ),
                        //),
                        _buildAuthLogo(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildNameTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildPasswordConfirmTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildRegisterBtn(),
                        //_flushBar(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
