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
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Personal Expenses"),
        ),
        body: Column(
          children: const [
            Charts(),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
