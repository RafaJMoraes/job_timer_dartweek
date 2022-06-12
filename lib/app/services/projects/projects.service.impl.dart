import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/entities/projects/project.task.dart';
import 'package:job_timer/app/repositories/projects/project.repository.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';

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

  @override
  Future<ProjectModel> addTaskModel(int projectId, ProjectTaskModel projectTaskModel) async {
    final projectTask = ProjectTask()
        ..name = projectTaskModel.name
        ..duration = projectTaskModel.duration;
      final project = await _projectRepository.addTask(projectId, projectTask);
      
      return ProjectModel.fromEntity(project);
  }

  @override
  Future<ProjectModel> findById(int projectId) async {
    final project = await _projectRepository.findById(projectId);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<void> finalizedProject(int projectID) {
    return _projectRepository.finalizeProject(projectID);
  }

  @override
  Future<List<ProjectModel>> findAllProjects() async {
    final projects = await  _projectRepository.findAllProject();
    return projects.map(ProjectModel.fromEntity).toList();
  }
}