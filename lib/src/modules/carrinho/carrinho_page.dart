import 'package:flutter/material.dart';

import '../../shared/models/mercadoria_model.dart';

class CarrinhoPage extends StatelessWidget {
  final int items;
  final List<Mercadoria> mercadorias;
  const CarrinhoPage(
      {required this.items, super.key, required this.mercadorias});

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
            Text('Items -> ${mercadorias.toString()}'),
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
