import 'package:flutter/material.dart';
import 'widgets/user_transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MyAppHome();
  }
}

class MyAppHome extends StatelessWidget {
  MyAppHome({super.key});
  final myAppBar = AppBar(
    title: const Text(
      "Personal Expenses",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "QuickSand",
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'GermaniaOne',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: myAppBar,
        body: Column(
          children: [
            UserTransaction(myAppBar.preferredSize.height),
          ],
        ),
      ),
    );
  }
}
