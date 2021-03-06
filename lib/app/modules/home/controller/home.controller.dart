import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/projects/projects.service.dart';
import '../../../view.model/project.model.dart';
import '../../../entities/projects/project.status.dart';
import 'dart:developer';

part 'home.status.dart';


class HomeController extends Cubit<HomeState> {

  final ProjectService _projectService;

  HomeController({required ProjectService projectService})
      : _projectService = projectService,
        super(HomeState.initial());
  
  Future<void> loadProjects() async {
    try{
      emit(state.copyWith(status: HomeStatus.loading));

      List<ProjectModel> _projects = [];
      if(state.projectFilter == ProjectStatus.general){
        _projects = await _projectService.findAllProjects();
      }else {
          _projects = await _projectService.findByStatus(state.projectFilter);
      }

      emit(state.copyWith(status: HomeStatus.complete, projects: _projects));
    } catch(e, s){
      log('Erro ao buscar projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filterByStatus(ProjectStatus status) async {
    try{
      emit(state.copyWith(
          status: HomeStatus.loading, projectFilter: status, projects: []));

      List<ProjectModel> _projects=[];
      if(status == ProjectStatus.general){
        _projects = await _projectService.findAllProjects();
      }else {
        _projects = await _projectService.findByStatus(status);
      }

      emit(state.copyWith(
          status: HomeStatus.complete,projectFilter: status, projects: _projects));
    }catch (e, s){
      log('Erro ao filtrar projeto', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStatus.failure,projectFilter: status, projects: []));
    }
  }

  Future<void> updateList() => filterByStatus(state.projectFilter);
}