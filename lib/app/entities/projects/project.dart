import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/converters.dart';
import 'package:job_timer/app/entities/projects/project.status.dart';
import 'package:job_timer/app/entities/projects/project.task.dart';

part 'project.g.dart';

@Collection()
class Project {

  @Id()
  int? id;

  late String name;
  @ProjectStatusConverter()

  late ProjectStatus projectStatus;

  final tasks = IsarLinks<ProjectTask>();
}