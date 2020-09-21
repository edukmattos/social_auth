import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    appCtrlThemeLoad();
  }

  @observable
  ThemeData themeData;

  @computed
  bool get isDark => themeData.brightness == Brightness.dark;

  @action
  void appCtrlThemeSwitch() {
    if (isDark) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
    print(isDark);
    appCtrlThemeSavePref();
  }

  void appCtrlThemeSavePref() {
    SharedPreferences.getInstance().then((instance) {
      instance.setBool('isDark', isDark);
    });
  }

  Future<void> appCtrlThemeLoad() async {
    final prefs = await SharedPreferences.getInstance();
    //await Future.delayed(Duration(seconds: 1));
    if (prefs.containsKey('isDark') && prefs.getBool('isDark')) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}
