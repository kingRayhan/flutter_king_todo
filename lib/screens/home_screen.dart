import 'package:flutter/material.dart';
import 'package:king_todo/models/project.dart';
import 'package:king_todo/services/isar_service.dart';
import 'package:king_todo/widgets/project_bottom_sheet.dart';

import '../constants.dart';
import '../widgets/project_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = IsarDatabaseService();
  final List<Project> _projects = [];

  _saveProject(Project project) async {
    await db.saveProject(project);
  }

  _getProjects() async {
    // var projects = await Hive.openBox<Project>(kProjectsDbName);
    // setState(() {
    //   _projects = projects.values.toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KING TODO'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        onPressed: _buildBottomSheet,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ScrollConfiguration(
          behavior: ListViewScrollBehaviourNoGlow(),
          child: _buildProjectList(),
        ),
      ),
    );
  }

  StreamBuilder<List<Project>> _buildProjectList() {
    return StreamBuilder(
      stream: db.projectsStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectCard(
                id: snapshot.data![index].id,
                title: snapshot.data![index].title,
                description: snapshot.data![index].description,
                onDelete: (id) => db.deleteProject(id),
                onEdit: (id) =>
                    _buildBottomSheet(project: snapshot.data![index]),
              );
            },
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("No projects yet", style: TextStyle(fontSize: 18.0)),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _buildBottomSheet({Project? project}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ProjectBottomSheet(
            project: project,
            onSave: (project) => _saveProject(project),
          ),
        );
      }),
    );
  }
}
