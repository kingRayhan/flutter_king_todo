import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:king_todo/models/project.dart';

import '../constants.dart';

class CreateProjectBottomSheet extends StatefulWidget {
  const CreateProjectBottomSheet({Key? key, this.onSave}) : super(key: key);
  final Function(Project project)? onSave;

  @override
  _CreateProjectBottomSheetState createState() =>
      _CreateProjectBottomSheetState();
}

class _CreateProjectBottomSheetState extends State<CreateProjectBottomSheet> {
  int descriptionLength = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _titleInputController = TextEditingController();
  final _descriptionInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3D3D3D)),
          color: const Color(0xFF191919),
          borderRadius: BorderRadius.circular(6.0)),
      height: 280.0,
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
            const SizedBox(height: 15.0),
            Expanded(
              child: TextFormField(
                style: GoogleFonts.lato(fontSize: 18.0),
                minLines: 4,
                maxLines: null,
                maxLength: 130,
                controller: _descriptionInputController,
                onChanged: (value) =>
                    setState(() => descriptionLength = value.length),
                decoration: const InputDecoration(
                    counterStyle: TextStyle(fontSize: 15.0),
                    hintText: "Write something about the project...",
                    border: OutlineInputBorder()),
              ),
            ),
            // SizedBox(height: 18.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _buildProjectThemeColorSwatch(color: Colors.yellow),
            //     _buildProjectThemeColorSwatch(color: Colors.purple),
            //     _buildProjectThemeColorSwatch(color: Colors.orange),
            //     _buildProjectThemeColorSwatch(color: Colors.teal),
            //     _buildProjectThemeColorSwatch(color: Colors.red),
            //     _buildProjectThemeColorSwatch(color: Colors.limeAccent),
            //     _buildProjectThemeColorSwatch(),
            //     _buildProjectThemeColorSwatch(),
            //     _buildProjectThemeColorSwatch(),
            //   ],
            // ),
            const SizedBox(height: 18.0),
            _saveButton(onPress: () {
              if (_formKey.currentState!.validate()) {
                final project = Project(
                    title: _titleInputController.text,
                    description: _descriptionInputController.text);
                widget.onSave?.call(project);
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

  Container _buildProjectThemeColorSwatch({Color color = Colors.black}) {
    return Container(
      width: 30,
      height: 30,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.0)),
    );
  }
}
