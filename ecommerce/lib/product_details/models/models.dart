// // To parse this JSON data, do
// //
// //     final products = productsFromJson(jsonString);

// import 'dart:convert';

// Products productsFromJson(String str) => Products.fromJson(json.decode(str));

// String productsToJson(Products data) => json.encode(data.toJson());

// class Products {
//   Products({
//     required this.productName,
//     required this.productId,
//     required this.status,
//     required this.price,
//     required this.img,
//   });

//   String productName;
//   String productId;
//   bool status;
//   String price;
//   String img;

//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//         productName: json['productName'].toString(),
//         productId: json['productId'].toString(),
//         status: json['status'],
//         price: json['price'],
//         img: json['img'],
//       );

//   Map<String, dynamic> toJson() => {
//         'productName': productName,
//         'productId': productId,
//         'status': status,
//         'price': price,
//         'img': img,
//       };
// }

class ProductsModel {
  late String productName;
  late String productId;
  late bool status;
  late String price;
  late String img;

  ProductsModel({
    required this.productName,
    required this.productId,
    required this.status,
    required this.price,
    required this.img,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'] as String;
    productId = json['productId'] as String;
    status = json['status'] as bool;
    price = json['price'] as String;
    img = json['img'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productId'] = this.productId;
    data['status'] = this.status;
    data['price'] = this.price;
    data['img'] = this.img;
    return data;
  }
}
