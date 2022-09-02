import 'package:isar/isar.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  late int? id;

  late String title;
  int? theme;

  late DateTime? createdAt;
  late DateTime? updatedAt;

  Project({
    this.id,
    required this.title,
    this.theme,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Project(id: $id, title: $title, theme: $theme, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
