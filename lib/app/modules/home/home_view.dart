import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/entities/projects/project.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/modules/home/widgets/header.projects.menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: SafeArea(child: ListTile(title: Text('Sair', textAlign: TextAlign.center,),)),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title:  Text('Projetos'),
                expandedHeight: 100,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30)
                    )
                ),
              ),
              SliverPersistentHeader(delegate: HeaderProjectsMenu(), pinned: true,),
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  height: 1000,
                  color: Colors.redAccent,
                )
              ]))
            ],
          ),
        )
    );
  }
}
