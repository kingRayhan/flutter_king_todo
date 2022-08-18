import 'package:flutter/material.dart';

import '../constants.dart';

class Project extends StatelessWidget {
  final String? title;
  final String? description;

  const Project({
    Key? key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18.0),
      decoration: BoxDecoration(
        color: kCardBackgroundColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "(Untitled)",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(height: 6),
            Text(
              description ?? "",
              style: TextStyle(
                  color: Color(0xFF8A8A8A), fontSize: 16.0, height: 1.4),
            ),
            SizedBox(height: 6),
            Text(
              "1 of 3 tasks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
