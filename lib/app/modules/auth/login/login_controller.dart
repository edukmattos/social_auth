import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';
import 'package:social_auth/app/modules/shared/auth/repositories/auth_exception_handler.dart';
import 'package:social_auth/enums/auth_status_enum.dart';

import '../../shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController _authController = Modular.get();
  AuthStatusEnum _authStatusEnum;

  String errorTitle = "";
  String errorMsg = "";

  @observable
  bool loading = false;

  @observable
  String email = "";

  @action
  changeEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Inválido.";
    return null;
  }

  String validatePassword() {
    if (validatorRequired(password)) return "Obrigatorio.";
    return null;
  }

  save() {}

  @action
  Future<void> loginCtrlGoogleSignIn() async {
    try {
      loading = true;
      await _authController.authCtrlGoogleSignIn().then((value) {
        _authStatusEnum = AuthStatusEnum.successful;
        Modular.to.pushReplacementNamed('/home');
        return true;
      });
    } catch (e) {
      loading = false;
      _authStatusEnum = AuthExceptionHandler.handleException(e);
      errorTitle = "Ops ...";
      errorMsg = AuthExceptionHandler.generateExceptionMessage(_authStatusEnum);
      print(errorMsg);
      return false;
    }

    //loading = true;
    //await _authController.authCtrlGoogleSignIn().then((value) {
    //  _authStatusEnum = AuthStatusEnum.successful;
    //  Modular.to.pushReplacementNamed('/home');
    //  return true;
    //}).catchError((e) {
    //  loading = false;
    //  _authStatusEnum = AuthExceptionHandler.handleException(e);
    //  errorTitle = "Ops ...";
    //  errorMsg = AuthExceptionHandler.generateExceptionMessage(_authStatusEnum);
    //  print(errorMsg);
    //  return false;
    //});
  }

  @action
  Future loginCtrlEmailPasswordSignIn(
      {@required String email, @required String password}) async {
    try {
      loading = true;
      await _authController.authCtrlEmailPasswordSignIn(email, password);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
