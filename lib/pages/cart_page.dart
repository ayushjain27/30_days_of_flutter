import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ]));
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor,
                  )),
                  child: "Buy".text.white.make())
              .w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            // itemCount: 5,
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
              // title: "Item 1".text.make(),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

// class _CartList extends StatefulWidget {
//   @override
//   State<_CartList> createState() => _CartListState();
// }

// class _CartListState extends State<_CartList> {
//   final _cart = CartModel();
//   @override
//   Widget build(BuildContext context) {
//     return _cart.items.isEmpty
//         ? "Nothing to show".text.xl3.makeCentered()
//         : ListView.builder(
//             // itemCount: 5,
//             itemCount: _cart.items.length,
//             itemBuilder: (context, index) => ListTile(
//               leading: Icon(Icons.done),
//               trailing: IconButton(
//                 icon: Icon(Icons.remove_circle_outline),
//                 onPressed: () {
//                   _cart.remove(_cart.items[index]);
//                   setState(() {});
//                 },
//               ),
//               // title: "Item 1".text.make(),
//               title: _cart.items[index].name.text.make(),
//             ),
//           );
//   }
// }
