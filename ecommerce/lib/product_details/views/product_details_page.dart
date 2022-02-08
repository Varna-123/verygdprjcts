import 'package:ecommerce/product_details/product_details.dart';
import 'package:ecommerce/product_details/views/product_list.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);

  List<ProductsModel> products = [
    ProductsModel(
      productName: "shoe",
      productId: "1234",
      status: true,
      price: "2000",
      img:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSpgR6oFSq_vaR6OdHWupJtvrCrl97F0CN2HazQs2UVeicyx5gM33c2JAmib6_bv5C7wYTuIP3qfgE7gJTiP3W-hS_W_GDKnQMShx33nyccK2AVLIg4nQyl&usqp=CAE",
    ),
    ProductsModel(
      productName: "cap",
      productId: "0123",
      status: true,
      price: "2000",
      img:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSpgR6oFSq_vaR6OdHWupJtvrCrl97F0CN2HazQs2UVeicyx5gM33c2JAmib6_bv5C7wYTuIP3qfgE7gJTiP3W-hS_W_GDKnQMShx33nyccK2AVLIg4nQyl&usqp=CAE",
    ),
    ProductsModel(
      productName: "mobile",
      productId: "2345",
      status: true,
      price: "2000",
      img:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSpgR6oFSq_vaR6OdHWupJtvrCrl97F0CN2HazQs2UVeicyx5gM33c2JAmib6_bv5C7wYTuIP3qfgE7gJTiP3W-hS_W_GDKnQMShx33nyccK2AVLIg4nQyl&usqp=CAE",
    ),
    ProductsModel(
      productName: "mobile",
      productId: "2345",
      status: true,
      price: "2000",
      img:
          "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSpgR6oFSq_vaR6OdHWupJtvrCrl97F0CN2HazQs2UVeicyx5gM33c2JAmib6_bv5C7wYTuIP3qfgE7gJTiP3W-hS_W_GDKnQMShx33nyccK2AVLIg4nQyl&usqp=CAE",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            "Ecommerces",
          ),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductList(
              data: products[index],
            );
          },
        )
        // body: SizedBox(
        //   width: 700,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 10),
        //     child: Text(
        //       "Should be left",
        //       textAlign: TextAlign.left,
        //     ),
        //   ),
        // ),
        );
  }
}
