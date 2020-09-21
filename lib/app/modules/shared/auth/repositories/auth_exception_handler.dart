import 'package:social_auth/enums/auth_status_enum.dart';

class AuthExceptionHandler {
  static handleException(e) {
    //print(e.code);
    var status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = AuthStatusEnum.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = AuthStatusEnum.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = AuthStatusEnum.userNotFound;
        break;
      case "user-disabled":
        status = AuthStatusEnum.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthStatusEnum.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthStatusEnum.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = AuthStatusEnum.emailAlreadyExists;
        break;
      default:
        status = AuthStatusEnum.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthStatusEnum.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatusEnum.wrongPassword:
        errorMessage = "Senha incorreta.";
        break;
      case AuthStatusEnum.userNotFound:
        errorMessage = "User with this email doesn't exist.";
        break;
      case AuthStatusEnum.userDisabled:
        errorMessage = "Conta desabilitada.";
        break;
      case AuthStatusEnum.tooManyRequests:
        errorMessage = "Muitas tentativas. Tente mais tarde.";
        break;
      case AuthStatusEnum.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case AuthStatusEnum.emailAlreadyExists:
        errorMessage = "E-mail existente. Please login or reset your password.";
        break;
      default:
        errorMessage = "Um erro inesperado ocorreu.";
    }

    return errorMessage;
  }
}
