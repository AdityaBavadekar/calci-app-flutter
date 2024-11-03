import 'package:calci/provider/calci_provider.dart';
import 'package:calci/widgets/calci_number_button.dart';
import 'package:flutter/material.dart';
import 'package:calci/widgets/input_box.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalciProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Calci",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.amber,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputBox(
              textController: provider.compController,
            ),
            Text(
              provider.errorController.value.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.6,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(buttonsListRow1.length,
                        (index) => buttonsListRow1[index]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(buttonsListRow2.length,
                        (index) => buttonsListRow2[index]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(buttonsListRow3.length,
                        (index) => buttonsListRow3[index]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(buttonsListRow4.length,
                        (index) => buttonsListRow4[index]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(buttonsListRow5.length,
                        (index) => buttonsListRow5[index]),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

List<Widget> buttonsListRow1 = [
  const CalciNumberButton(text: "C"),
  const CalciNumberButton(text: "<"),
  const CalciNumberButton(text: "%"),
  const CalciNumberButton(text: "÷"),
];

List<Widget> buttonsListRow2 = [
  const CalciNumberButton(text: "7"),
  const CalciNumberButton(text: "8"),
  const CalciNumberButton(text: "9"),
  const CalciNumberButton(text: "x"),
];

List<Widget> buttonsListRow3 = [
  const CalciNumberButton(text: "4"),
  const CalciNumberButton(text: "5"),
  const CalciNumberButton(text: "6"),
  const CalciNumberButton(text: "-"),
];

List<Widget> buttonsListRow4 = [
  const CalciNumberButton(text: "1"),
  const CalciNumberButton(text: "2"),
  const CalciNumberButton(text: "3"),
  const CalciNumberButton(text: "+"),
];

List<Widget> buttonsListRow5 = [
  const CalciNumberButton(text: "^"),
  const CalciNumberButton(text: "0"),
  const CalciNumberButton(text: "."),
  const CalciNumberButton(text: "="),
];
