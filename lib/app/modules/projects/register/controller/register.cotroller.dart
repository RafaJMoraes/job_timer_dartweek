import 'package:bloc/bloc.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/view.model/project.model.dart';
import 'dart:developer';
part 'register.state.dart';

class ProjectRegisterController extends Cubit<RegisterStatus>{

  final ProjectService _projectService;

  ProjectRegisterController({required ProjectService projectService})
      : _projectService = projectService,
        super(RegisterStatus.initial);

  Future<void>  register({required String name, required int estimate}) async {
    try{
      emit(RegisterStatus.loading);
      ProjectModel projectModel = ProjectModel(
          name: name,
          estimate: estimate,
          status: ProjectStatus.inProgress,
          tasks: []);

      await _projectService.register(projectModel);
      // await Future.delayed(Duration(seconds: 1));
      emit(RegisterStatus.success);
      // emit(RegisterStatus.initial);
    }catch (e,s) {
      log('Erro ao regitrar projeto', error: e, stackTrace: s);
      emit(RegisterStatus.error);
    }
  }


}