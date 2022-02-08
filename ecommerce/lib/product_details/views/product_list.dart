import 'package:ecommerce/product_details/product_details.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key, required this.data}) : super(key: key);

  ProductsModel data;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(widget.data.productName),
        leading: Image.network(widget.data.img),
        subtitle: Text(widget.data.productId),
        trailing: Text(widget.data.price),
      ),
      onTap: () {},
    );
  }
}
