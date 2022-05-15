import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  final int items;
  const CarrinhoPage({required this.items, super.key});

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
            const Text('Items -> {}'),
            ElevatedButton(
              onPressed: () {},
              child: const Center(
                child: Text('Comprar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
