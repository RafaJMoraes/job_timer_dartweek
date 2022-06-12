import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/my_flutter_app_icons.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/modules/home/widgets/project.detail.appbar.dart';
import 'package:job_timer/app/modules/home/widgets/project.detail.task.tile.dart';
import 'package:job_timer/app/modules/home/widgets/project.pie.chart.dart';
import 'package:job_timer/app/modules/projects/detail/controller/project.detail.controller.dart';
import 'package:job_timer/app/view.model/project.model.dart';

class ProjectDetailView extends StatefulWidget {
  final ProjectDetailController controller;
  const ProjectDetailView({Key? key, required this.controller}) : super(key: key);

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailsState>(
        bloc: widget.controller,
        listener: (context, state) {
          if(state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno').show();
          }
        },
        builder: (context, state) {
          final project = state.projectModel;
          switch(state.status){
            case ProjectDetailStatus.inital:
              return const Center(
                child: Text('Carregando Projeto....'),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ProjectDetailStatus.complete:
              return _buildProjectDetail(context, project!);
            case ProjectDetailStatus.failure:
              if(project != null){
                 return _buildProjectDetail(context, project);
              } else {
                return const Center(child: Text('Erro ao carregar Projeto')
                );
              }
          }
        }
      ),
    );
  }

  CustomScrollView _buildProjectDetail(BuildContext context, ProjectModel project) {
    return CustomScrollView(
          slivers: [
            ProjectDetailAppBar(project: project),
            SliverList(delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 50),
                ProjectPieChart(
                  projectEstimate: project.estimate!,
                  totalTasks: project.tasks.fold<int>(0, (previousValue, element) => previousValue += element.duration)
                ),
                const SizedBox(height: 25),
                ...project.tasks.map((task) => ProjectDetailTaskTile(
                  taskModel: task
                )).toList()

              ]
            )),
            SliverFillRemaining(
              fillOverscroll: false,
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Visibility(
                    visible: project.status != ProjectStatus.finalized,
                    child: ElevatedButton.icon(
                        onPressed: (){widget.controller.finalizeProject();},
                        icon: const Icon(IconsApp.ok_circled2),
                        label: const Text('Finalizar Projeto')),
                  ),
                ),
                ),
              )
          ],
        );
  }
}

