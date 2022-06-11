import 'package:flutter/material.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({super.key}) : super(
        expandedHeight: 100,
        pinned: true,
        centerTitle: true,
        title:const Text('Project w'),
        toolbarHeight: 100,
        shape:const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(30))),
        flexibleSpace: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 1.5),
              child: Container(
                margin:const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 48,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('10 tasks')),
                          _NewsTasks()
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
  );

}
class _NewsTasks extends StatelessWidget {
  const _NewsTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding:const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const Text('Adicionar tasks'),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

