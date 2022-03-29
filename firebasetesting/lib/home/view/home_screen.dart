import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetesting/profile/profile.dart';
import 'package:firebasetesting/router/route_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hii'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("welcome"),
          TextButton(
            onPressed: () {
              CollectionReference products =
                  FirebaseFirestore.instance.collection('products');

              try {
                products.add({
                  'product_name': 'shirt', /////sample
                  'price': '2300',
                  'size': 'M',
                }).then(
                  (value) => print('user add'),
                );
              } catch (e) {
                print("falied to add");
              }
            },
            child: Text("add product"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute<MaterialPageRoute>(
                  builder: (context) => Profile()));
            },
            child:  Text('View profile'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              print('=================+++++++++logout success');

              await Navigator.pushReplacementNamed(
                  context, RouterConstants.loginRoute);
            },
            child: Text('Logout'),
          )
        ],
      )),
    );
  }
}
