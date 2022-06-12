import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/entities/projects/project.task.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findAllProject();
  Future<List<Project>> findByStatus(ProjectStatus status);
  Future<Project> findById(int projectId);
  Future<Project> addTask(int projectId, ProjectTask projectTask);
  Future<void> finalizeProject(int projectID);
}