import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:social_auth/app/app_controller.dart';
import 'package:social_auth/app/modules/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AppController appController;

  _HomeControllerBase(this.appController);

  homeCtrlSignOut() async {
    await Modular.get<AuthController>().authCtrlSignOut();
    Modular.to.pushReplacementNamed('/auth/login');
  }
}
