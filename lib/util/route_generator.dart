import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:rescar/login.dart';
import 'package:rescar/screens/welcome.dart';
import 'package:rescar/form.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
            builder: (_) => CustomSplash(
                  backGroundColor: const Color.fromARGB(255, 56, 128, 255),
                  imagePath: 'assets/icon/logo.png',
                  home: WelcomeScreen(),
                  duration: 2000,
                  type: CustomSplashType.StaticDuration,
                ));
      case '/welcome':
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomeScreen(),
        );
      case '/login':
        return MaterialPageRoute<dynamic>(
          builder: (context) => Login(),
        );
      default:
        return _erroRoute();
    }
  }

  static Route _erroRoute() => MaterialPageRoute<dynamic>(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Página de erro'),
          ),
          body: const Center(
            child: Text('Página não encontrada para a condição informada.'),
          ),
        ),
      );
}
