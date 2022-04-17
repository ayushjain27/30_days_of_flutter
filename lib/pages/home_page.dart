import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Ayush";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      // body: Container(
      //     height: 100,
      //     width: 100,
      //     color: Colors.green,
      // ),

      // body: Container(
      //   constraints: BoxConstraints(
      //     minHeight: 70,
      //     maxHeight: 200,
      //     minWidth: 70,
      //     maxWidth: 200),
      //   child: Container(
      //     height: 100,
      //     width: 100,
      //     color: Colors.red,
      //   ),
      // ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter by $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
