import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/view.model/project.model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}