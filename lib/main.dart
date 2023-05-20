import 'package:flutter/material.dart';
import 'package:task_flutter/pages/fetchapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          title: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Products',
                style: TextStyle(
                    color: Color(0XFFF5F5F5),
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              )),
          backgroundColor: const Color(0XFF33907C),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 234, 233, 233),
      body: const FetchData(),
    ));
  }
}
