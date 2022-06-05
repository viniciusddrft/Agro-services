import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:flutter/material.dart';

import '../../shared/models/servico_model.dart';

class CarrinhoPage extends StatelessWidget {
  final int items;
  final List<Produto> produtos;
  final List<Servico> servicos;
  const CarrinhoPage(
      {required this.items,
      super.key,
      required this.produtos,
      required this.servicos});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você tem $items no carrinho'),
            Text('Items -> ${produtos.length}'),
            Text('Items -> ${servicos.length}'),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: const Center(
                  child: Text('Comprar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
