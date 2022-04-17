class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone12 Pro",
        desc: "Apple iPhone 12 generation",
        price: 999,
        color: "#33505a",
        image:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.apple.com%2Fnewsroom%2F2020%2F10%2Fapple-introduces-iphone-12-pro-and-iphone-12-pro-max-with-5g%2F&psig=AOvVaw0SqH73T7UNBtQVT07csrv3&ust=1650259053155000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCNj7j6asmvcCFQAAAAAdAAAAABAO")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
