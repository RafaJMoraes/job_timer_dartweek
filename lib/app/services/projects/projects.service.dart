import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
  Future<List<ProjectModel>> findAllProjects();
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTaskModel(int projectId, ProjectTaskModel projectTaskModel);
  Future<void> finalizedProject(int projectID);
}