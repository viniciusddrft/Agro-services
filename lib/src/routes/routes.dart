import 'package:agro_services/src/cadastro/cadastro.dart';
import 'package:agro_services/src/home/home_page.dart';
import 'package:agro_services/src/login/login.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    if (settings.name == '/home') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const MyHomePage(),
      );
    } else if (settings.name == '/login') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      );
    }
    if (settings.name == '/cadastro') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const Cadastro(),
      );
    } else {
      return null;
    }
  }
}
