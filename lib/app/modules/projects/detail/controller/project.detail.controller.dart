
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import 'package:job_timer/app/view.model/project.model.dart';

part 'project.detail.state.dart';

class ProjectDetailController  extends Cubit<ProjectDetailsState>{

  final ProjectService _projectService;
  ProjectDetailController({required ProjectService projectService})
      : _projectService = projectService,
        super(const ProjectDetailsState.initial());


  setProjectModel(ProjectModel projectModel){
    emit(state.copyWith(status: ProjectDetailStatus.complete, projectModel: projectModel));
  }

  Future<void> updateProject() async {
    final project = await _projectService.findById(state.projectModel!.id!);
    emit(state.copyWith(projectModel: project,status: ProjectDetailStatus.complete));
  }

  Future<void> finalizeProject() async {
    try{
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      final projectId = state.projectModel!.id!;
      await _projectService.finalizedProject(projectId);
      updateProject();
    }catch(e, s){
      log(e.toString(), error: e, stackTrace: s);
    }
  }

}