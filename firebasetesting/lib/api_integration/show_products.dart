import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShowProducts extends StatefulWidget {
  ShowProducts({Key? key}) : super(key: key);

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  Future<List<Products>> getData() async {
    var res =
        await http.get(Uri.parse('https://fakestoreapi.com/products?limit=5'));
    dynamic jsonresponse = jsonDecode(res.body);

    print('---------------------------');

    print(jsonresponse);
    

    List<Products> products = [];


    for (var i in jsonresponse) {
      print('================================');
      print(i);
      Products product = Products(
        i['id'],
        i['title'],
        i['description'],
        i['price'],
        i['category'],
        i['image'],
      );

      products.add(product);
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'),
      ),
      body: Card(
        child: FutureBuilder<List<Products>>(
          future: getData(),
          builder: (context, AsyncSnapshot<List<Products>> snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title.toString()),
                    subtitle: Column(
                      children: [
                        Text(snapshot.data![index].description.toString()),
                        Text(snapshot.data![index].category.toString())
                      ],
                    ),
                    trailing: Text(snapshot.data![index].price.toString()),
                    leading: CircleAvatar(
                      radius: 30,
                      child:
                          Image.network(snapshot.data![index].image.toString()),
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class Products {
  dynamic id, title, description, image, price, category;
  Products(this.id, this.title, this.description, this.price, this.category,
      this.image);
}
