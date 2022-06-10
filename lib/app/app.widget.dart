import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/ui/app.config.ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppConfigUi.themeData,
      builder: asuka.builder,
      title: 'Job timer',
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate
    );
  }
}
