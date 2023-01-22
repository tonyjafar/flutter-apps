import 'package:flutter/material.dart';
import 'widgets/user_transaction.dart';
import 'widgets/charts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MyAppHome();
  }
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Personal Expenses"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Charts(),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
