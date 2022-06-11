import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';
import '../entities/projects/project.task.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int? estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;

  ProjectModel({this.id,required this.name,required this.estimate,required this.status,required this.tasks});

  factory ProjectModel.fromEntity(Project project) {

    project.tasks.loadSync();

    return ProjectModel(
        id: project.id,
        name: project.name,
        estimate: project.estimate,
        status: project.projectStatus,
        tasks: project.tasks.map(ProjectTaskModel.fromEntity).toList()
    );
  }


}