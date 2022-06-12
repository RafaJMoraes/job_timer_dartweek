
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/my_flutter_app_icons.dart';
import 'package:job_timer/app/modules/home/controller/home.controller.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel project;

  const ProjectTile({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()async {
          await Modular.to.pushNamed('/project/detail', arguments: project);
          Modular.get<HomeController>().updateList();
        },
        child: Container(
        constraints: const BoxConstraints(maxHeight: 90),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        child: Column(
          children: [
            _ProjectName(project: project),
            Expanded(child: _ProjectProgress(project: project))
          ],
        ),
      )
    );
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectModel project;

  const _ProjectName({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(project.name),
          Icon(
            IconsApp.angle_double_right,
            color: Theme.of(context).primaryColor,
            size: 20,
          )
        ],
      ),
    );
  }
}


class _ProjectProgress extends StatelessWidget {
  final ProjectModel project;

  const _ProjectProgress({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    
    final totalTASKS = project.tasks.fold<int>(0, (previousValue, element) => previousValue += element.duration);

    var percent = 0.0;

    if(totalTASKS > 0 && project.estimate != null){
      percent = totalTASKS / project.estimate!;
    }

    
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
        Expanded(child: LinearProgressIndicator(
         value: percent,
         backgroundColor: Colors.grey.shade400,
          color: Theme.of(context).primaryColor,
       )),
        Padding(padding: EdgeInsets.only(left: 10), child: Text('${project.estimate} h'),)
        ],
      ),
    
    );
  }

  ProjectTaskModel soma(value, element) => value + element.duration;
}
