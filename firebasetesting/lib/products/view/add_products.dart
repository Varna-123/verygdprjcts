import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  final TextEditingController _produtname = TextEditingController(text: ''),
      _productprice = TextEditingController(text: ''),
      _productquantity = TextEditingController(text: ''),
      _productdescription = TextEditingController(text: '');

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddProduct'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ADD PRODUCT'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _produtname,
                    decoration: const InputDecoration(
                      labelText: 'product name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _productprice,
                      decoration: const InputDecoration(
                        labelText: 'product price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _productquantity,
                    decoration: const InputDecoration(
                      labelText: 'product quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _productdescription,
                    decoration: const InputDecoration(
                      labelText: 'product description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                      onPressed: () {
                        try {
                          CollectionReference product =
                              FirebaseFirestore.instance.collection('Products');
                          product.add({
                            'product name': _produtname.text,
                            'product price': _productprice.text,
                            'product quantity': _productquantity.text,
                            'product description': _productdescription.text,
                            'Date': date
                          }).then((value) => print("prodct added"));
                        } catch (e) {
                          print(e);
                          print('failed to add');
                        }
                      },
                      child: Text('Add product')),
                )
              ],
            ),
          ),
        ));
  }
}
