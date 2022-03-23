import 'package:flutter/material.dart';

import '../../modules/cadastro/cadastro_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/login/login_page.dart';

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
