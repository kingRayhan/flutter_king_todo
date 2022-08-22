import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:king_todo/models/project.dart';
import 'package:king_todo/widgets/CreateProjectBottomSheet.dart';

import '../constants.dart';
import '../widgets/project_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Project> _projects = [];

  _saveProject(Project project) async {
    var projects = await Hive.openBox<Project>(kProjectsDbName);
    projects.add(project);

    setState(() {
      _projects.add(project);
    });

    print("Saving project..");
  }

  _getProjects() async {
    var projects = await Hive.openBox<Project>(kProjectsDbName);
    setState(() {
      _projects = projects.values.toList();
    });
  }

  @override
  void initState() {
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KING TODO'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        onPressed: () => _buildBottomSheet(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ScrollConfiguration(
          behavior: ListViewScrollBehaviourNoGlow(),
          child: ListView(
            children: [
              for (Project project in _projects)
                ProjectCard(
                    title: project.title, description: project.description)
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: ((context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: CreateProjectBottomSheet(
              onSave: (project) {
                _saveProject(project);
                print("title: ${project.title}");
                print("description: ${project.description}");
              },
            ),
          )),
    );
  }
}
