
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/register/controller/register.cotroller.dart';
import 'package:job_timer/app/modules/projects/register/register.project.view.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProjectRegisterModule  extends Module{

  @override
  List<Bind<Object>> get binds =>  [
    BlocBind.lazySingleton((i) => ProjectRegisterController(projectService: i())) //=>vem do AppModule
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/' , child:(context, args)=> RegisterProjectView(registerController: Modular.get(),))
  ];
  
}