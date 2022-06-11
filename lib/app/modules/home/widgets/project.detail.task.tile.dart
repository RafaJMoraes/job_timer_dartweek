import 'package:flutter/material.dart';

class ProjectDetailTaskTile extends StatelessWidget {
  const ProjectDetailTaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal:15),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:const [
          Text('Nova task',style: TextStyle(fontWeight: FontWeight.w500, )),
          Text.rich(TextSpan(
            children: [
              TextSpan(text: 'Duração'),
              TextSpan(text: '   '),
              TextSpan(text: '4H', style: TextStyle(fontWeight: FontWeight.bold, )),
            ]
          ))
        ],

      ),
    );
  }
}
