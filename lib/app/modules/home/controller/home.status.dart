part of 'home.controller.dart';

enum HomeStatus {
  initial, loading, complete, failure
}

class HomeState extends Equatable {
  @override

  List<Object?> get props => [projects, status, projectFilter];

  final HomeStatus status;
  final ProjectStatus projectFilter;
  final List<ProjectModel> projects;

  HomeState._({
    required this.status,required this.projectFilter,required this.projects,
  });

  HomeState.initial() : this._(status: HomeStatus.initial, projectFilter: ProjectStatus.inProgress, projects: []);

  HomeState copyWith({
    HomeStatus? status,
    ProjectStatus? projectFilter,
    List<ProjectModel>? projects,
  }) {
    return HomeState._(
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
      projects: projects ?? this.projects,
    );
  }
}