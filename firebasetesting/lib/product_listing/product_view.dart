import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetesting/router/route_constants.dart';
import 'package:flutter/material.dart';

class ProdutView extends StatelessWidget {
  ProdutView({Key? key}) : super(key: key);

  CollectionReference productdetails =
      FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Product Details'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterConstants.addProducts);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
        stream: productdetails.snapshots(), //response
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
                children: snapshot.data!.docs.map((document) {
              return ListTile(
                title: Text(document['product name'].toString()),
                trailing: Text(document['product price'].toString()),
                subtitle: Text(document['product description'].toString()),
              );
            }).toList());
          }
        },
      ),
    );
  }
}
