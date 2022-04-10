import 'package:agro_services/src/modules/mercadorias/mercadorias_interface.dart';
import 'package:flutter/material.dart';

import '../../modules/cadastro/cadastro_page.dart';
import '../../modules/carrinho/carrinho_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/login/login_page.dart';
import '../../modules/mercadorias/mercadorias_page.dart';

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
    } else if (settings.name == '/cadastro') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const CadastroPage(),
      );
    } else if (settings.name == '/mercadorias') {
      final Map<String, TypeOfMerchandise> arguments =
          settings.arguments as Map<String, TypeOfMerchandise>;
      if (arguments['type'] == TypeOfMerchandise.produts) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const MerchandisePage(
            typeOfMerchandise: TypeOfMerchandise.produts,
          ),
        );
      } else if (arguments['type'] == TypeOfMerchandise.services) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const MerchandisePage(
            typeOfMerchandise: TypeOfMerchandise.services,
          ),
        );
      } else {
        throw Exception('Route bug in -> TypeOfMerchandise');
      }
    } else if (settings.name == '/carrinho') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const CarrinhoPage(),
      );
    } else {
      return null;
    }
  }
}
