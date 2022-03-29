import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetesting/router/route_constants.dart';
import 'package:firebasetesting/sign_up/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailController =
          TextEditingController(text: ''),
      _passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      print('------------------------');
                      // try {
                      //   UserCredential userCredential = await FirebaseAuth
                      //       .instance
                      //       .signInWithEmailAndPassword(
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //   );

                      //   Navigator.pushNamed(context, RouterConstants.homeRoute);
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'user-note-found') {
                      //     print("no user found");
                      //   } else if (e.code == 'wrong-password') {
                      //     print("wrong password");
                      //   }
                      // }
                      print(_emailController.text);
                      print(_passwordController.text);
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                        print('-------------');
                        Navigator.pushNamed(context, RouterConstants.homeRoute);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sign in"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.amber, fontSize: 15),
                    )),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
