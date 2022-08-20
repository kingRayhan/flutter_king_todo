import 'package:flutter/material.dart';
import 'package:king_todo/screens/project_screen.dart';
import 'package:king_todo/widgets/CreateProjectBottomSheet.dart';

import '../constants.dart';
import '../widgets/project_card.dart';

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
              ProjectCard(
                title: "In publishing and graphic",
                description:
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectScreen()));
                },
              ),
              const ProjectCard(),
              const ProjectCard(),
              const ProjectCard(),
              const ProjectCard(),
              const ProjectCard(),
              const ProjectCard(),
              const ProjectCard(),
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
            child: const CreateProjectBottomSheet(),
          )),
    );
  }
}
