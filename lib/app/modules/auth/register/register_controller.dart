import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../shared/auth/auth_controller.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  AuthController _authController = Modular.get();

  String errorTitle;
  String errorMsg;

  @observable
  bool loading = false;

  @observable
  String name = "";

  @action
  changeName(String value) => name = value;

  @observable
  String email = "";

  @action
  changeEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;

  @observable
  String passwordConfirm = "";

  @action
  changePasswordConfirm(String value) => passwordConfirm = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    return null;
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

  String validatePasswordConfirm() {
    if (validatorRequired(passwordConfirm)) return "Obrigatorio.";
    if (password != passwordConfirm) return "Diferentes.";
    return null;
  }

  @action
  Future registerCtrlEmailPasswordSignUp(String email, String passord) async {
    try {
      loading = true;
      await _authController.authCtrlEmailPasswordSignUp(email, password);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
      print(e);
    }
  }
}
