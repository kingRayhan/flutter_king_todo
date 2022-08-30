// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:isar/isar.dart';

part 'project.g.dart';

@Collection()
class Project {
  @Id()
  late int? id;

  late String title;
  late String? description;
  dynamic theme;

  late DateTime? createdAt;
  late DateTime? updatedAt;

  Project({
    this.id,
    required this.title,
    this.description,
    this.theme,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, theme: $theme, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
