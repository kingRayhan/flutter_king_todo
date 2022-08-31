// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/project.dart';

class IsarDatabaseService {
  late Future<Isar> _db;

  IsarDatabaseService() {
    _db = _init();
    print("IsarDatabaseService created");
  }

  /// Initialize the database
  Future<Isar> _init() async {
    if (Isar.instanceNames.isEmpty) {
      final appDir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        schemas: [ProjectSchema],
        directory: appDir.path,
        inspector: true,
      );
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveProject(Project project) async {
    final isar = await _db;

    await isar.writeTxn((isar) async {
      project.createdAt ??= DateTime.now();
      project.updatedAt ??= DateTime.now();
      var projectId = await isar.projects.put(project);
      print("Saved project with id: $projectId");
    });
  }

  Future<void> deleteProject(int projectId) async {
    final isar = await _db;

    await isar.writeTxn((isar) async {
      var id = await isar.projects.delete(projectId);
      print("Saved project with id: $id");
    });
  }

  Stream<List<Project>> projectsStream() async* {
    final isar = await _db;
    yield* isar.projects
        .where()
        .sortByUpdatedAtDesc()
        .watch(initialReturn: true);
  }
}
