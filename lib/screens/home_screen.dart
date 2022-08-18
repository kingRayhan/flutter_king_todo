import 'package:flutter/material.dart';
import 'package:king_todo/screens/project_screen.dart';

import '../constants.dart';
import '../widgets/project.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KING TODO'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kAccentColor,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProjectScreen())),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ScrollConfiguration(
            behavior: ListViewScrollBehaviourNoGlow(),
            child: ListView(
              children: const [
                Project(),
                Project(
                  title: "Heyyyyy",
                ),
                Project(),
                Project(),
                Project(),
                Project(),
                Project(),
                Project(),
                Project(),
              ],
            ),
          ),
        ));
  }
}
