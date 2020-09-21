import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../config/app_config.dart';
import '../../../config/constants.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const LoginPage(
      {Key key,
      this.title = appPageTagAuthLogin,
      this.subtitle = appPageTagFunctionSearch})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Esqueceu a senha ?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Me lembrar',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
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
                      controller.loginCtrlEmailPasswordSignIn(
                        email: controller.email,
                        password: controller.password,
                      );
                    }
                  : null,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
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

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('ou'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text('ou'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => controller
                .loginCtrlGoogleSignIn()
                .then((value) => _flushBar())
                .catchError(
              (onError) {
                _flushBar();
              },
            ),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF4C05),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFEB4D25),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in Google',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Não tem conta ainda ? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registre-se',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Modular.to.pushReplacementNamed('/auth/register');
                },
            ),
          ],
        ),
      ),
    );
  }

  SpeedDial _buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.event_add,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.email, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () {
            Modular.to.pushReplacementNamed('/auth/register');
          },
          //label: 'First Child',
          //labelStyle: TextStyle(fontWeight: FontWeight.w500),
          //labelBackgroundColor: Colors.deepOrangeAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.face_rounded, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('SECOND CHILD'),
          //label: 'Second Child',
          //labelStyle: TextStyle(fontWeight: FontWeight.w500),
          //labelBackgroundColor: Colors.green,
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice, color: Colors.white),
          backgroundColor: Colors.blue,
          onTap: () => print('THIRD CHILD'),
          //labelWidget: Container(
          //  color: Colors.blue,
          //  margin: EdgeInsets.only(right: 10),
          //  padding: EdgeInsets.all(6),
          //  child: Text('Custom Label Widget'),
          //),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.today),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
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
      floatingActionButton: _buildSpeedDial(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomBar(),
      body: Form(
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
                        _buildEmailTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        //_buildSignInWithText(),
                        _divider(),
                        //_facebookButton(),
                        //_googleButton(),
                        _buildSocialBtnRow(),
                        _buildSignupBtn(),
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
