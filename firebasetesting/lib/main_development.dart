// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetesting/app/app.dart';
import 'package:firebasetesting/bootstrap.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message {$message.messageId}');//cloud  messaging
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//
  await Firebase.initializeApp();//firebase connection to app

  await FirebaseMessaging.instance.requestPermission(//cloud message
    sound: true,
    badge: true,
    alert: true,
    provisional: false,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  bootstrap(() => const App());
}
