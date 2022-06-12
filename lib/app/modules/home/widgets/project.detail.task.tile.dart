import 'package:flutter/material.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';

class ProjectDetailTaskTile extends StatelessWidget {
  final ProjectTaskModel taskModel;
  const ProjectDetailTaskTile({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal:15),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${taskModel.name}',style: TextStyle(fontWeight: FontWeight.w500, )),
          Text.rich(TextSpan(
            children: [
              TextSpan(text: 'Duração'),
              TextSpan(text: '   '),
              TextSpan(text: '${taskModel.duration.toString()}H', style: TextStyle(fontWeight: FontWeight.bold, )),
            ]
          ))
        ],

      ),
    );
  }
}
