import 'package:agro_services/src/modules/carrinho/carrinho_page.dart';
import 'package:agro_services/src/modules/produtos/produtos_page.dart';
import 'package:agro_services/src/modules/servicos/servicos_page.dart';
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
    } else if (settings.name == '/cadastro') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const CadastroPage(),
      );
    } else if (settings.name == '/produtos') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const ProdutosPage(),
      );
    } else if (settings.name == '/servicos') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const ServicosPage(),
      );
    } else if (settings.name == '/carrinho') {
      return MaterialPageRoute(
        builder: (BuildContext context) => const CarrinhoPage(),
      );
    } else {
      return null;
    }
  }
}
