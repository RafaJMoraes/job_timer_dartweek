import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database.impl.dart';
import 'package:job_timer/app/modules/home/home_module.dart';
import 'package:job_timer/app/modules/splash/splash.view.dart';
import 'package:job_timer/app/services/auth/auth.service.dart';
import 'package:job_timer/app/services/auth/auth.service.impl.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton<Database>((i) => DatabaseImpl()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args)=> const SplashView()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}