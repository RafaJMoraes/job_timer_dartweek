import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/register/project.register.module.dart';

class ProjectModule  extends Module{

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/register' , module: ProjectRegisterModule())
  ];

  
}