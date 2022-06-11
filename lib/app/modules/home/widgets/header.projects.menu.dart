import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/modules/home/controller/home.controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {

  final HomeController controller;

  HeaderProjectsMenu({required this.controller});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return LayoutBuilder(builder: (context, contraints){
      return Container(
        height: contraints.maxHeight,
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: contraints.maxWidth * 0.5,
              child: DropdownButtonFormField<ProjectStatus>(
                 value: ProjectStatus.inProgress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    isCollapsed: true
                  ),
                  items: ProjectStatus.values.map((e) => DropdownMenuItem(value: e, child: Text(e.label))).toList(),
                  onChanged: (status){
                   if(status != null) {
                     controller.filterByStatus(status);
                   }
                   print(status);
                  }
              ),
            ),
            SizedBox(
              width: contraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label:const  Text('Novo Projeto'),
                onPressed: () async {
                  await Modular.to.pushNamed('/register');
                  controller.loadProjects();
                },

              )
            )
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 80;

  @override
  // TODO: implement minExtent
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}