
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'package:job_timer/app/view.model/project.task.model.dart';

part 'task.state.dart';


class TaskController extends  Cubit<TaskStatus>{

  final ProjectService _projectService;
  late final ProjectModel _project;
  TaskController({required ProjectService projectService})
      : _projectService = projectService,
        super(TaskStatus.initial);
  void setProjectModel(ProjectModel project) => _project = project;

  Future<void> register({required String name, required int duration}) async {
    try{
      emit(TaskStatus.loading);
      final projectTaskModel = ProjectTaskModel(name: name, duration: duration);
      await Future.delayed(const Duration(seconds: 1));
      await _projectService.addTaskModel(_project.id!, projectTaskModel);
      emit(TaskStatus.success);
    } catch (e, s){
      log('Erro ao tentar salvar task', error: e, stackTrace: s);
      emit(TaskStatus.failure);
    }
  }
}