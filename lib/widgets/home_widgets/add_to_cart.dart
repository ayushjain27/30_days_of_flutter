import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          // backgroundColor: MaterialStateProperty.all(
          //     MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      // isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart_outlined),
      // child: isInCart ? Icon(Icons.done) : "Add to cart".text.make());
    );
  }
}

// class AddToCart extends StatefulWidget {
//   final Item catalog;

//   const AddToCart({Key? key, required this.catalog}) : super(key: key);
//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   final _cart = CartModel();
//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog) ?? false;
//     return ElevatedButton(
//       onPressed: () {
//         if (!isInCart) {
//           isInCart = isInCart.toggle();
//           final _catalog = CatalogModel();
//           _cart.catalog = _catalog;
//           _cart.add(widget.catalog);
//           setState(() {});
//         }
//       },
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
//           // backgroundColor: MaterialStateProperty.all(
//           //     MyTheme.darkBluishColor),
//           shape: MaterialStateProperty.all(
//             StadiumBorder(),
//           )),
//       child:
//           isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
//           // isInCart ? Icon(Icons.done) : Icon(Icons.add_shopping_cart_outlined),
//       // child: isInCart ? Icon(Icons.done) : "Add to cart".text.make());
//     );
//   }
// }
