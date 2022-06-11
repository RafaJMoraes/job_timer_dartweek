import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';

abstract class ProjectRepository {
  Future<void> register(Project project);
  Future<List<Project>> findAllProject();
  Future<List<Project>> findByStatus(ProjectStatus status);
}