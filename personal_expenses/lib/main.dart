import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/user_transaction.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations(
  //[
  //DeviceOrientation.portraitUp,
  //DeviceOrientation.portraitDown,
  //],
  //);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  MyAppHome({super.key});
  final Widget myAppBar = Platform.isIOS
      ? const CupertinoNavigationBar(
          middle: Text(
            "Personal Expenses",
          ),
        )
      : AppBar(
          title: const Text(
            "Personal Expenses",
          ),
        );
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            navigationBar: myAppBar as ObstructingPreferredSizeWidget,
            child: SafeArea(
              child: Column(
                children: [
                  UserTransaction(
                    (myAppBar as PreferredSizeWidget).preferredSize.height,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: myAppBar as PreferredSizeWidget,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Column(
              children: [
                UserTransaction(
                  (myAppBar as PreferredSizeWidget).preferredSize.height,
                ),
              ],
            ),
          );
  }
}
