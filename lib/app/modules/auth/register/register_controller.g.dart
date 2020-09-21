// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegisterController = BindInject(
  (i) => RegisterController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RegisterControllerBase.isFormValid'))
          .value;

  final _$loadingAtom = Atom(name: '_RegisterControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$nameAtom = Atom(name: '_RegisterControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordConfirmAtom =
      Atom(name: '_RegisterControllerBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.reportRead();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.reportWrite(value, super.passwordConfirm, () {
      super.passwordConfirm = value;
    });
  }

  final _$registerCtrlEmailPasswordSignUpAsyncAction =
      AsyncAction('_RegisterControllerBase.registerCtrlEmailPasswordSignUp');

  @override
  Future<dynamic> registerCtrlEmailPasswordSignUp(
      String email, String passord) {
    return _$registerCtrlEmailPasswordSignUpAsyncAction
        .run(() => super.registerCtrlEmailPasswordSignUp(email, passord));
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordConfirm(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changePasswordConfirm');
    try {
      return super.changePasswordConfirm(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
name: ${name},
email: ${email},
password: ${password},
passwordConfirm: ${passwordConfirm},
isFormValid: ${isFormValid}
    ''';
  }
}
