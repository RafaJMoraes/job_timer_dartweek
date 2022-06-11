import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/home/controller/home.controller.dart';
import 'package:job_timer/app/modules/home/widgets/header.projects.menu.dart';
import 'package:job_timer/app/modules/home/widgets/project.tile.dart';
import 'package:job_timer/app/view.model/project.model.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  BlocListener<HomeController, HomeState>(
      bloc: widget.controller,
        listener: (context, state){
          if(state.status == HomeStatus.failure){
            AsukaSnackbar.alert('Erro ao carregar projetos').show();
          }
        },
      child: SafeArea(
          child: Scaffold(
            drawer: const Drawer(
              child:  SafeArea(child: ListTile(title: Text('Sair', textAlign: TextAlign.center,),)),
            ),
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title:  Text('Projetos'),
                  expandedHeight: 100,
                  centerTitle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(30)
                      )
                  ),
                ),
                SliverPersistentHeader(delegate: HeaderProjectsMenu(controller: widget.controller), pinned: true,),
                BlocSelector<HomeController, HomeState, bool>(
                    bloc: widget.controller,
                    selector: (state)=> state.status == HomeStatus.loading,
                    builder: (context, show){
                      return SliverVisibility(
                          visible: show,
                          sliver:const SliverToBoxAdapter(
                            child: SizedBox(
                              height:50,
                              child: Center(child: CircularProgressIndicator.adaptive(),),
                            ),
                          )
                      );
                    }
                ),
                BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                    bloc: widget.controller,
                    selector: (state)=> state.projects,
                    builder: (context, projects){
                      return SliverList(delegate: SliverChildListDelegate(
                          projects.map((project) =>
                              ProjectTile(project: project)
                          ).toList()
                      ));
                    }
                )
              ],
            ),
          )
      ),
    );
  }
}
