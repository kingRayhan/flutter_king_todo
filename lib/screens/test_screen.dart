import 'package:flutter/material.dart';
import 'package:king_todo/constants.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screen_width = MediaQuery.of(context).size.width;
    var _screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          _card(_screen_height),
        ],
      ),
    );
  }

  Stack _card(double _screen_height) {
    return Stack(
      children: [
        Container(
          color: kCardBackgroundColor,
          width: double.infinity,
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Project Name"),
              SizedBox(
                height: 15.0,
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
            ],
          ),
        ),
        Positioned(
          right: 0.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6.0,
                color: Colors.red,
              )
            ],
          ),
        )
      ],
    );
  }
}
