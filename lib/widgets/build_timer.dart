import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildTimer extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var seconds;
  // ignore: prefer_typing_uninitialized_variables
  var text;

  BuildTimer({super.key, required this.seconds, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Text("$seconds")),
        const SizedBox(
          height: 50,
        ),
        Text("$text"),
      ],
    );
  }
}
