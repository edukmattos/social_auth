import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/auth/register/register_module.dart';
import 'modules/home/home_module.dart';
import 'modules/shared/auth/auth_controller.dart';
import 'modules/shared/auth/repositories/auth_repository.dart';
import 'modules/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRouter> get routers => [
        //ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter("/",
            child: (_, args) => SplashPage(),
            transition: TransitionType.rightToLeft),
        ModularRouter('/auth/login',
            module: LoginModule(), transition: TransitionType.rightToLeft),
        ModularRouter('/auth/register',
            module: RegisterModule(), transition: TransitionType.rightToLeft),
        ModularRouter('/home',
            module: HomeModule(), transition: TransitionType.rightToLeft),
      ];

  @override
  Widget get bootstrap => AppWidget(controller: to.get<AppController>());

  static Inject get to => Inject<AppModule>.of();
}
