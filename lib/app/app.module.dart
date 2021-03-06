import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/database/database.impl.dart';
import 'package:job_timer/app/modules/home/home_module.dart';
import 'package:job_timer/app/modules/projects/project_module.dart';
import 'package:job_timer/app/modules/projects/register/project.register.module.dart';
import 'package:job_timer/app/modules/splash/splash.view.dart';
import 'package:job_timer/app/repositories/projects/project.repository.dart';
import 'package:job_timer/app/repositories/projects/project.repository.impl.dart';
import 'package:job_timer/app/services/auth/auth.service.dart';
import 'package:job_timer/app/services/auth/auth.service.impl.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/services/projects/projects.service.impl.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
    Bind.lazySingleton<Database>((i) => DatabaseImpl()),
    Bind.lazySingleton<ProjectRepository>((i) => ProjectRepositoryImpl(database: i())),
    Bind.lazySingleton<ProjectService>((i) => ProjectServiceImpl(projectRepository: i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args)=> const SplashView()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/project', module: ProjectModule()),

  ];
}