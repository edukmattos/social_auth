// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$authStatusEnumAtom = Atom(name: '_AuthControllerBase.authStatusEnum');

  @override
  AuthStatusEnum get authStatusEnum {
    _$authStatusEnumAtom.reportRead();
    return super.authStatusEnum;
  }

  @override
  set authStatusEnum(AuthStatusEnum value) {
    _$authStatusEnumAtom.reportWrite(value, super.authStatusEnum, () {
      super.authStatusEnum = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(User value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authStatusEnum: ${authStatusEnum},
user: ${user}
    ''';
  }
}
