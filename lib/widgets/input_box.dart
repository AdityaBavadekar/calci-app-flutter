import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.textController});

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.black,
            filled: true,
          ),
          readOnly: true,
          autofocus: true,
          showCursor: true,
          cursorColor: Colors.amber,
          cursorWidth: 4,
          textAlign: TextAlign.right,
          style: const TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
