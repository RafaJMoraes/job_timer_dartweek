
part of 'project.detail.controller.dart';

enum ProjectDetailStatus{
  inital,
  complete,
  loading,
  failure
}


class ProjectDetailsState extends Equatable{
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;
  const ProjectDetailsState.initial() : this._(status: ProjectDetailStatus.inital);
  const ProjectDetailsState._({required this.status, this.projectModel});

  @override
  List<Object?> get props => [status, projectModel];

  ProjectDetailsState copyWith({
    ProjectDetailStatus? status,
    ProjectModel? projectModel,
  }) {
    return ProjectDetailsState._(
      status: status ?? this.status,
      projectModel: projectModel ?? this.projectModel,
    );
  }


}