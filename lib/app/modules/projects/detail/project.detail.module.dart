import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/detail/controller/project.detail.controller.dart';
import 'package:job_timer/app/modules/projects/detail/project.detail.view.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class ProjectDetailModule extends Module {

  @override
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => ProjectDetailController(projectService: i())),
  ];




  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) {
      final ProjectModel projectModel = args.data;
      return  ProjectDetailView(controller: Modular.get()..setProjectModel(projectModel));
    })
  ];
}