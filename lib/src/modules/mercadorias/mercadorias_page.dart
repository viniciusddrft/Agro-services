import 'package:flutter/material.dart';

import 'mercadorias_interface.dart';

class MerchandisePage extends StatefulWidget implements MercadoriasInterface {
  @override
  final TypeOfMerchandise typeOfMerchandise;

  const MerchandisePage({required this.typeOfMerchandise, Key? key})
      : super(key: key);

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Agro Services'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                  context, '/mercadorias',
                  arguments: {'type': TypeOfMerchandise.produts}),
              child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 50),
                child: Text('Produtos'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(
                  context, '/mercadorias',
                  arguments: {'type': TypeOfMerchandise.services}),
              child: const Text('Serviços'),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              icon: const Icon(Icons.account_circle_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/carrinho'),
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (widget.typeOfMerchandise == TypeOfMerchandise.produts) {
            return const Center(child: Text('Products'));
          } else if (widget.typeOfMerchandise == TypeOfMerchandise.services) {
            return const Center(
              child: Text('Services'),
            );
          } else {
            throw Exception(['Error type Merchandise']);
          }
        },
      ),
    );
  }
}
