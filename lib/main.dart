import 'package:calci/provider/calci_provider.dart';
import 'package:flutter/material.dart';
import 'package:calci/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CalciApp());
}

class CalciApp extends StatelessWidget {
  const CalciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalciProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
