import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/entities/projects/project.task.dart';
import 'package:job_timer/app/repositories/projects/project.repository.dart';
import 'dart:developer';

 class ProjectRepositoryImpl implements ProjectRepository{
   final Database _database;
   ProjectRepositoryImpl({required Database database}): _database = database;
  @override
  Future<void> register(Project project)  async {
    try {
      final connection = await _database.openConnection();

      connection.writeTxn((isar) async {
        return isar.projects.put(project);
      });
    } on IsarError catch (e, s){
      log('Erro ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findAllProject() async {
    final connection = await _database.openConnection();
    return  connection.projects.filter().projectStatusLessThan(ProjectStatus.general, include: true).findAll();
  }


  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _database.openConnection();

    final projects = connection.projects.filter().projectStatusEqualTo(status).findAll();

    return projects;
  }

  @override
  Future<Project> addTask(int projectId, ProjectTask projectTask) async {
    final connection = await _database.openConnection();
    final project = await findById(projectId);
    project.tasks.add(projectTask);

    await connection.writeTxn((isar) => project.tasks.save());

    return project;
  }

  @override
  Future<Project> findById(int projectId) async {
    final connection = await _database.openConnection();
    final project = await connection.projects.get(projectId);
    if(project == null){
      throw Failure(message: 'Erro ao buscar projeto');
    }

    return project;
  }

  @override
  Future<void> finalizeProject(int projectID) async {
    final connection = await _database.openConnection();
    final project = await findById(projectID);
    project.projectStatus = ProjectStatus.finalized;
    await connection.writeTxn((isar) => connection.projects.put(project, saveLinks: true));
  }

}