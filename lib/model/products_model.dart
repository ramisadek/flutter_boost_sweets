import 'package:meta/meta.dart';

class ProductsModel {
  ProductsModel({
    @required this.image,
    @required this.title,
    @required this.category,
    @required this.favNumber,
    @required this.fav,
    @required this.price,
    @required this.rate,
  });

  final String image;
  final String title;
  final String category;
  final int favNumber;
  final bool fav;
  final int price;
  final double rate;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    image: json["image"] == null ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png" : json["image"],
    title: json["title"] == null ? "no title" : json["title"],
    category: json["category"] == null ? "no category" : json["category"],
    favNumber: json["fav_number"] == null ? 0 : json["fav_number"],
    fav: json["fav"] == null ? false : json["fav"],
    price: json["price"] == null ? 0 : json["price"],
    rate: json["rate"] == null ? 0.0 : json["rate"].toDouble(),
  );
}
