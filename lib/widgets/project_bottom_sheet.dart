import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:king_todo/models/project.dart';

import '../constants.dart';

class ProjectBottomSheet extends StatefulWidget {
  const ProjectBottomSheet({Key? key, this.onSave, this.project})
      : super(key: key);

  final Function(Project project)? onSave;
  final Project? project;

  @override
  _ProjectBottomSheetState createState() => _ProjectBottomSheetState(project);
}

class _ProjectBottomSheetState extends State<ProjectBottomSheet> {
  int descriptionLength = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Project? project;

  _ProjectBottomSheetState(this.project);

  final _titleInputController = TextEditingController();
  final _themeInputController = TextEditingController();
  final List<Color> _themes = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo
  ];

  @override
  void initState() {
    if (project != null) {
      _titleInputController.text = project!.title ?? "";
      _themeInputController.text = project!.theme.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3D3D3D)),
          color: const Color(0xFF191919),
          borderRadius: BorderRadius.circular(6.0)),
      height: 220.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              style: GoogleFonts.lato(fontSize: 18.0),
              maxLength: 50,
              validator: ValidationBuilder().required().maxLength(35).build(),
              controller: _titleInputController,
              decoration: const InputDecoration(
                hintText: "Project Title",
                border: OutlineInputBorder(),
                counterText: "",
              ),
            ),
            const SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // --------------- Themes ---------------
                for (var themeColor in _themes)
                  _buildProjectThemeColorSwatch(
                      color: themeColor,
                      isSelected: _themeInputController.text ==
                          themeColor.value.toString(),
                      onChangeTheme: (color) {
                        setState(() {
                          _themeInputController.text = color.toString();
                        });
                      }),
              ],
            ),
            const SizedBox(height: 18.0),
            _saveButton(onPress: () {
              if (_formKey.currentState!.validate()) {
                widget.onSave?.call(
                  Project(
                    id: project?.id,
                    title: _titleInputController.text,
                    theme: _themeInputController.text != ""
                        ? int.parse(_themeInputController.text)
                        : null,
                  ),
                );
                Navigator.pop(context);
              }
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector _saveButton({required Function() onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: const Text(
          "Save",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
      ),
    );
  }

  GestureDetector _buildProjectThemeColorSwatch(
      {Color color = Colors.black,
      bool isSelected = false,
      Function(int colorValue)? onChangeTheme}) {
    double size = 35.0;
    return GestureDetector(
      onTap: () {
        onChangeTheme?.call(color.value);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: isSelected ? kAccentColor : Colors.transparent,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
