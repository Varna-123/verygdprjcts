// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:firebasetesting/api_integration/api.dart';
import 'package:firebasetesting/app/home/bottomnavigation.dart';
import 'package:firebasetesting/counter/counter.dart';
import 'package:firebasetesting/home/home.dart';
import 'package:firebasetesting/l10n/l10n.dart';
import 'package:firebasetesting/login/logindetails.dart';
import 'package:firebasetesting/otp/otp.dart';
import 'package:firebasetesting/product_listing/product_view.dart';
import 'package:firebasetesting/products/product_details.dart';
import 'package:firebasetesting/profile/profile.dart';

import 'package:firebasetesting/router/app_router.dart';
import 'package:firebasetesting/sign_up/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../firebase_storage/firebase_imgupload.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Login(),
    );
  }
}
