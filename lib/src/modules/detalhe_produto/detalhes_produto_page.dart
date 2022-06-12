import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:flutter/material.dart';

import '../home/home_controller.dart';

class DetalhesProdutoPage extends StatefulWidget {
  final Produto produto;
  const DetalhesProdutoPage({super.key, required this.produto});

  @override
  State<DetalhesProdutoPage> createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState extends State<DetalhesProdutoPage> {
  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Agro Services'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/carrinho', arguments: {
              'items': homeController.numberOfItemsInCart.value,
              'produtos': homeController.produtosInCart,
              'servicos': homeController.servicosInCart,
            }),
            icon: const Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: ValueListenableBuilder(
              valueListenable: homeController.numberOfItemsInCart,
              builder: (BuildContext context, int value, Widget? child) =>
                  homeController.numberOfItemsInCart.value > 0
                      ? Text('$value')
                      : Container(),
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                widget.produto.nome,
                style: const TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.produto.imagem),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Descrição -> ${widget.produto.descricao}'),
                      Text('Peso -> ${widget.produto.peso}'),
                      Text('tamanho -> ${widget.produto.tamanho}'),
                      Text('preço -> ${widget.produto.valor}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () =>
                        homeController.addToCart(produto: widget.produto),
                    child: const Center(
                      child: Text('Adicionar ao carinho'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
