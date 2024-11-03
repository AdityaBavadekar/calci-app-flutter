import 'package:calci/provider/calci_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalciNumberButton extends StatelessWidget {
  const CalciNumberButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          {Provider.of<CalciProvider>(context, listen: false).setValue(text)},
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 44, 44, 44),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        width: 68,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 38,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
