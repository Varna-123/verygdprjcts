import 'dart:developer';

import 'package:firebasetesting/counter/view/counter_page.dart';
import 'package:firebasetesting/home/home.dart';
import 'package:firebasetesting/login/view/login.dart';
import 'package:firebasetesting/products/product_details.dart';
import 'package:firebasetesting/router/route_constants.dart';
import 'package:firebasetesting/sign_up/signup.dart';
import 'package:flutter/material.dart';

import '../product_listing/product_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouterConstants.loginRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Login(),
        );
        break;
      case RouterConstants.signupRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SignUp(),
        );
      case RouterConstants.homeRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => HomeScreen(),
        );
      case RouterConstants.addProducts:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => AddProduct(),
        );
      case RouterConstants.showProduct:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => ProdutView(),
        );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => Login(),
        );
    }
  }
}
