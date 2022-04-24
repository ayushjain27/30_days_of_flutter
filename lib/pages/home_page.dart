import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';
import 'package:flutter_catalogue/widgets/themes.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Ayush";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});

    // print(catalogJson);
    // print(decodedData);
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Catalog App"),
//       ),
//       // body: Container(
//       //     height: 100,
//       //     width: 100,
//       //     color: Colors.green,
//       // ),

//       // body: Container(
//       //   constraints: BoxConstraints(
//       //     minHeight: 70,
//       //     maxHeight: 200,
//       //     minWidth: 70,
//       //     maxWidth: 200),
//       //   child: Container(
//       //     height: 100,
//       //     width: 100,
//       //     color: Colors.red,
//       //   ),
//       // ),
//       // body: Center(
//       //   child: Container(
//       //     child: Text("Welcome to $days days of flutter by $name"),
//       //   ),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: GridTile(
//                         header: Container(
//                           child: Text(
//                             item.name,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                         child: Image.network(item.image),
//                         footer: Container(
//                           child: Text(
//                             item.price.toString(),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ));
//                 },
//                 itemCount: CatalogModel.items.length,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//         // child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//         //     ? ListView.builder(
//         //         // itemCount: dummyList.length,
//         //         itemCount: CatalogModel.items.length,
//         //         // itemBuilder: (context, index) {
//         //         itemBuilder: (context, index) =>
//         //             ItemWidget(item: CatalogModel.items[index]),
//         //         // return ItemWidget(
//         //         //   item: dummyList[index],
//         //         // );
//         //         // return ItemWidget(item: CatalogModel.items[index]);
//         //         // },
//         //       )
//         //     : Center(
//         //         child: CircularProgressIndicator(),
//         //       ),
//       ),

//       drawer: MyDrawer(),
//     );
//   }
// }


// class HomePage extends StatelessWidget {
//   final int days = 30;
//   final String name = "Ayush";
//   @override
//   Widget build(BuildContext context) {
//     final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Catalog App"),
//       ),
//       // body: Container(
//       //     height: 100,
//       //     width: 100,
//       //     color: Colors.green,
//       // ),

//       // body: Container(
//       //   constraints: BoxConstraints(
//       //     minHeight: 70,
//       //     maxHeight: 200,
//       //     minWidth: 70,
//       //     maxWidth: 200),
//       //   child: Container(
//       //     height: 100,
//       //     width: 100,
//       //     color: Colors.red,
//       //   ),
//       // ),
//       // body: Center(
//       //   child: Container(
//       //     child: Text("Welcome to $days days of flutter by $name"),
//       //   ),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView.builder(
//           itemCount: dummyList.length,
//           // itemCount: CatalogModel.items.length,
//           itemBuilder: (context, index) {
//             return ItemWidget(
//               item: dummyList[index],
//               );
//             // return ItemWidget(item: CatalogModel.items[index]);
//           },
//         ),
//       ),

//       drawer: MyDrawer(),
//     );
//   }
// }
