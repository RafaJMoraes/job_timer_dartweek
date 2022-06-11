import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    contentPadding: EdgeInsets.all(10),
                    isCollapsed: true
                  ),
                  items: ProjectStatus.values.map((e) => DropdownMenuItem(value: e, child: Text(e.label))).toList(),
                  onChanged: (value){}
              ),
            ),
            SizedBox(
              width: contraints.maxWidth * 0.4,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Novo Projeto'),
                onPressed: (){},

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