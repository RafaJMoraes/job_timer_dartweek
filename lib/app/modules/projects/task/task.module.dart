import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/projects/task/controller/task.controller.dart';
import 'package:job_timer/app/modules/projects/task/task.view.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class TaskModule extends Module {

  @override
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => TaskController(projectService: i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) {
      final project = args.data;
      return TaskView(taskController: Modular.get()..setProjectModel(project));
    })
  ];
}