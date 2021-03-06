import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home.controller.dart';
import 'package:job_timer/app/modules/home/home_view.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => HomeController(projectService: i())) // appModule
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) {
        final controller = Modular.get<HomeController>()..loadProjects();
        return HomeView(controller: controller);
    }),
  ];
}