import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Ayush";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
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
      // body: Center(
      //   child: Container(
      //     child: Text("Welcome to $days days of flutter by $name"),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          // itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
              );
            // return ItemWidget(item: CatalogModel.items[index]);
          },
        ),
      ),

      drawer: MyDrawer(),
    );
  }
}
