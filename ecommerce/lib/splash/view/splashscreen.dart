import 'package:ecommerce/router/router_constants.dart';
import 'package:ecommerce/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashBloc _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => _splashBloc..add(SplashStartEvent()),
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            print(state);
            if (state is SplashNavigateHome) {
              Navigator.pushNamed(context, RouterConstants.loginRoute);
            }
          },
          builder: (context, state) {
            print(state);
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/app_img/shoppngicn.png',
                    width: 60,
                  ),
                  const Text(
                    'welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              // child: Text(
              //   'welcome',
              //   style: TextStyle(
              //     color: Colors.amber,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 50,
              //   ),
              // ),
            );
          },
        ),
      ),
    );
  }
}
