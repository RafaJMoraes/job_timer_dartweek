import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/detail/project.detail.module.dart';
import 'package:job_timer/app/modules/projects/register/project.register.module.dart';
import 'package:job_timer/app/modules/projects/task/task.module.dart';

class ProjectModule  extends Module{

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/register' , module: ProjectRegisterModule()),
    ModuleRoute('/detail' , module: ProjectDetailModule()),
    ModuleRoute('/task' , module: TaskModule()),
  ];

  
}