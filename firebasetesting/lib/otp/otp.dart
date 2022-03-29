import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetesting/router/route_constants.dart';
import 'package:flutter/material.dart';

class OTP extends StatelessWidget {
  OTP({Key? key}) : super(key: key);

  final TextEditingController _mobilecontroller =
          TextEditingController(text: ''),
      _otpcontroller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('OTP VERIFY'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _mobilecontroller,
                decoration: const InputDecoration(
                    labelText: 'Enter your mobile number'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () async {
                      // print('------------------------');
                      // print(_mobilecontroller.text);
                      FirebaseAuth auth = FirebaseAuth.instance;

                      await auth.verifyPhoneNumber(
                          phoneNumber: _mobilecontroller.text,
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          codeAutoRetrievalTimeout: (verificationId) {
                            print(verificationId);
                            print("verification failed");
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            showDialog<dynamic>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Enter your OTP'),
                                  content: TextFormField(
                                    controller: _otpcontroller,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        PhoneAuthCredential credential =
                                            PhoneAuthProvider.credential(
                                                verificationId: verificationId,
                                                smsCode: _otpcontroller.text);
                                        print("----------------------------");
                                        print(credential);

                                        var result = await auth
                                            .signInWithCredential(credential);
                                        print("------------------------");
                                        print('user is ${result.user}');
                                        Navigator.pushNamed(
                                            context, RouterConstants.homeRoute);
                                      },
                                      child: Text('Submit'),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          verificationFailed: (error) {
                            showDialog<dynamic>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Invalid Phone number',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  );
                                });
                            print('please add a valid phone number');
                          });
                    },
                    child: Text('submit')),
              )
            ],
          ),
        ));
  }
}
