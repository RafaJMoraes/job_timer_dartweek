import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/repositories/projects/project.repository.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/view.model/project.model.dart';

class ProjectServiceImpl implements ProjectService {

  final ProjectRepository _projectRepository;

  ProjectServiceImpl({required ProjectRepository projectRepository}) : _projectRepository = projectRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
        ..id = projectModel.id
        ..name = projectModel.name
        ..projectStatus = projectModel.status
        ..estimate = projectModel.estimate;

    await _projectRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectRepository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();

  }
}