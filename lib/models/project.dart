import 'package:hive/hive.dart';
part 'project.g.dart';

@HiveType(typeId: 1)
class Project {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String description;

  Project({
    required this.id,
    required this.title,
    required this.description,
  });
}
