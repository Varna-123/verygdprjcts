import 'package:ecommerce/router/router_constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   title: Text("login"),
      // ),
      body: Center(
        child: InkWell(
          onTap: () {
            print("woekedddddd");
            Navigator.pushNamed(context, RouterConstants.counterRoute);
          },
          child: Text("Hiisdfghjhgfdsdfghjh"),
        ),
      ),
    );
  }
}
