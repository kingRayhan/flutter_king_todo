import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants.dart';

class ProjectCard extends StatelessWidget {
  final Function()? onTap;
  final Function(int id)? onDelete;
  final Function(int id)? onEdit;
  final int? id;
  final String? title;
  final String? description;

  const ProjectCard({
    Key? key,
    this.title,
    this.description,
    this.onTap,
    this.onDelete,
    this.onEdit,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18.0),
        decoration: BoxDecoration(
          color: kCardBackgroundColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                onPressed: (BuildContext context) {
                  onEdit!(id!);
                },
              ),
              SlidableAction(
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (BuildContext context) {
                  onDelete!(id!);
                },
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "(Untitled)",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    if (description != null) const SizedBox(height: 6),
                    if (description != null)
                      Text(
                        description ?? "",
                        style: const TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 16.0,
                            height: 1.4),
                      ),
                    const SizedBox(height: 6),
                    const Text(
                      "1 of 3 tasks",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    )
                  ],
                ),
                Container(
                  width: 6.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
