import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/modules/projects/detail/controller/project.detail.controller.dart';
import 'package:job_timer/app/view.model/project.model.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({required ProjectModel project, super.key}) : super(
        expandedHeight: 100,
        pinned: true,
        centerTitle: true,
        title: Text(project.name),
        toolbarHeight: 100,
        shape:const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(30))),
        flexibleSpace: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 1.5),
              child: Container(
                margin:const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding:const EdgeInsets.only(left: 10),
                              child: Text('${project.tasks.length} tasks')),
                         Visibility(
                             visible: project.status == ProjectStatus.inProgress,
                             replacement:const Padding(
                               padding:  EdgeInsets.all(8.0),
                               child: Text('Projeto finalizado!'),
                             ),
                             child: _NewsTasks(project: project)
                         )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
  );

}
class _NewsTasks extends StatelessWidget {
  final ProjectModel project;
  const _NewsTasks({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await Modular.to.pushNamed('/project/task/', arguments: project);
          Modular.get<ProjectDetailController>().updateProject();
        },
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Text('Adicionar tasks'),
          const SizedBox(
            width: 10,
          )
        ],
      )
    );
  }
}

