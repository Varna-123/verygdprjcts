// import 'package:ecommerce/counter/counter.dart';
import 'package:ecommerce/login/login_details.dart';
import 'package:ecommerce/router/router_constants.dart';
import 'package:ecommerce/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case RouterConstants.splashRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SplashScreen(),
        );
        break;
      case RouterConstants.loginRoute:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => LoginPage(),
        );
      // case RouterConstants.counterRoute:
      //   return MaterialPageRoute<MaterialPageRoute>(
      //     // builder: (_) => CounterPage(),
      //   );

      default:
        return MaterialPageRoute<MaterialPageRoute>(
          builder: (_) => SplashScreen(),
        );
    }
  }
}
