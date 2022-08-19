import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          onPressed: () => {
            _buildBottomSheet(context),
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectScreen())),
          },
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
                ProjectCard(),
                ProjectCard(
                  title: "Heyyyyy",
                ),
                ProjectCard(),
              ],
            ),
          ),
        ));
  }

  Future<dynamic> _buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: ((context) => Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3D3D3D)),
                color: const Color(0xFF191919),
                borderRadius: BorderRadius.circular(6.0)),
            height: 280.0,
            child: Column(
              children: [
                TextField(
                  style: GoogleFonts.lato(fontSize: 18.0),
                  decoration: const InputDecoration(
                    hintText: "Project Title",
                    border: InputBorder.none,
                  ),
                ),
                Expanded(
                  child: TextField(
                    style: GoogleFonts.lato(fontSize: 18.0),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        hintText: "Write something about the project...",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProjectThemeColorSwatch(color: Colors.yellow),
                    _buildProjectThemeColorSwatch(color: Colors.purple),
                    _buildProjectThemeColorSwatch(color: Colors.orange),
                    _buildProjectThemeColorSwatch(color: Colors.teal),
                    _buildProjectThemeColorSwatch(color: Colors.red),
                    _buildProjectThemeColorSwatch(color: Colors.limeAccent),
                    _buildProjectThemeColorSwatch(),
                    _buildProjectThemeColorSwatch(),
                    _buildProjectThemeColorSwatch(),
                  ],
                )
              ],
            ),
          )),
    );
  }

  Container _buildProjectThemeColorSwatch({Color color = Colors.black}) {
    return Container(
      width: 30,
      height: 30,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.0)),
    );
  }
}
