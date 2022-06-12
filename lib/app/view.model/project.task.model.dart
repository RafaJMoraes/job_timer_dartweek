import 'package:job_timer/app/entities/projects/project.status.dart';
import '../entities/projects/project.task.dart';

class ProjectTaskModel {
  final int? id;
  final String name;
  final int duration;

  ProjectTaskModel({this.id,required this.name,required this.duration});

  factory ProjectTaskModel.fromEntity(ProjectTask projectTask){
    return ProjectTaskModel(id: projectTask.id, name: projectTask.name, duration: projectTask.duration);
  }
}