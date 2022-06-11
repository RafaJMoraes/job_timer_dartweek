import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/my_flutter_app_icons.dart';
import 'package:job_timer/app/modules/home/widgets/project.detail.appbar.dart';
import 'package:job_timer/app/modules/home/widgets/project.detail.task.tile.dart';
import 'package:job_timer/app/modules/home/widgets/project.pie.chart.dart';

class ProjectDetailView extends StatefulWidget {
  const ProjectDetailView({Key? key}) : super(key: key);

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 50),
              ProjectPieChart(),
              SizedBox(height: 50),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
              ProjectDetailTaskTile(),
            ]
          )),
          SliverFillRemaining(
            fillOverscroll: false,
            hasScrollBody: false,
            child: Padding(
              padding:EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton.icon(
                    onPressed: (){},
                    icon: Icon(IconsApp.ok_circled2),
                    label: Text('Finalizar Projeto')),
              ),
              ),
            )
        ],
      ),
    );
  }
}

