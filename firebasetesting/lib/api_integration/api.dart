import 'package:firebasetesting/api_integration/show_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class API extends StatefulWidget {
  const API({Key? key}) : super(key: key);

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('show prdts'),
        ),
        body: Card(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<MaterialPageRoute>(
                        builder: (context) => ShowProducts(),
                      ));
                },
                child: Text('show products'))));
  }
}
