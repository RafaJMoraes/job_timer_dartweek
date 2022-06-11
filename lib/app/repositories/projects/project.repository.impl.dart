import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
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
        return await isar.projects.put(project);
      });
    } on IsarError catch (e, s){
      log('Erro ao cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findAllProject() {
    // TODO: implement findAllProject
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final connection = await _database.openConnection();

    final projects = connection.projects.filter().projectStatusEqualTo(status).findAll();

    return projects;
  }

}