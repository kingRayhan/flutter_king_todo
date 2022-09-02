import 'package:flutter/material.dart';
import 'package:king_todo/models/project.dart';

const List<Map<String, dynamic>> todos = [
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
  {"done": false, "text": "Buy milk"},
  {"done": true, "text": "Buy eggs"},
  {"done": false, "text": "Buy bread"},
  {"done": false, "text": "Buy cheese"},
];

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Project;

    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          style: TextStyle(fontSize: 22.0),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Project Name",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            Text(args.title),
            for (var todo in todos)
              _buildTodoCard(text: todo["text"], isDone: todo["done"]),
          ],
        ),
      ),
    );
  }

  Container _buildTodoCard({required String text, bool isDone = false}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 18.0),
      decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(6.0)),
      width: double.infinity,
      child: Row(
        children: [
          _checkBox(isChecked: isDone),
          const SizedBox(width: 15.0),
          Text(
            text,
            style: TextStyle(
                decoration: isDone == true
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: isDone ? const Color(0xFF8A8A8A) : Colors.white),
          )
        ],
      ),
    );
  }

  Container _buildNewTodoInput() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 18.0),
      decoration: BoxDecoration(
          color: const Color(0xFF2B2B2B),
          borderRadius: BorderRadius.circular(6.0)),
      width: double.infinity,
      child: Row(
        children: [_checkBox(isChecked: false)],
      ),
    );
  }

  Stack _checkBox({bool isChecked = false}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            color: const Color(0xFF3D3D3D),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        if (isChecked)
          Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3.0),
            ),
          )
      ],
    );
  }
}
