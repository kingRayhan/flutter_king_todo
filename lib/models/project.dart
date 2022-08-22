import 'package:hive/hive.dart';
part 'project.g.dart';

@HiveType(typeId: 1)
class Project {
  @HiveField(1)
  late String title;

  @HiveField(2)
  late String description;

  @HiveField(3)
  dynamic theme;

  Project({
    required this.title,
    required this.description,
    this.theme,
  });
}
