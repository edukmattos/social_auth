import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:social_auth/enums/auth_status_enum.dart';

import 'repositories/interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _iAuthRepository = Modular.get();

  @observable
  AuthStatusEnum authStatusEnum = AuthStatusEnum.loading;

  @observable
  User user;

  @action
  setUser(User value) {
    user = value;
    authStatusEnum =
        user == null ? AuthStatusEnum.signOut : AuthStatusEnum.successful;
  }

  _AuthControllerBase() {
    _iAuthRepository.authRepoUser().then(setUser);
  }

  Future<UserCredential> authCtrlGoogleSignIn() async {
    return await _iAuthRepository.authRepoGoogleSignIn();

    //user.user.displayName;
    //return user;
  }

  Future authCtrlEmailPasswordSignIn(String email, String password) async {
    await _iAuthRepository.authRepoEmailPasswordSignIn(
      email,
      password,
    );
  }

  Future authCtrlEmailPasswordSignUp(email, password) async {
    await _iAuthRepository.authRepoEmailPasswordSignUp(
      email,
      password,
    );
  }

  Future authCtrlSignOut() {
    return _iAuthRepository.authRepoSignOut();
  }
}
