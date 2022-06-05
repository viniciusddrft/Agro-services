import 'package:agro_services/src/modules/home/home_controller.dart';

import '../../shared/models/servico_model.dart';

import 'package:flutter/material.dart';

class DetalhesServicoPage extends StatefulWidget {
  final Servico servico;
  const DetalhesServicoPage({super.key, required this.servico});

  @override
  State<DetalhesServicoPage> createState() => _DetalhesServicoPageState();
}

class _DetalhesServicoPageState extends State<DetalhesServicoPage> {
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
                widget.servico.nome,
                style: const TextStyle(fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.servico.imagem),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Descrição -> ${widget.servico.descricao}'),
                      Text('Peso -> ${widget.servico.fornecedor}'),
                      Text('tamanho -> ${widget.servico.contato}'),
                      Text('preço -> ${widget.servico.valor}'),
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
                        homeController.addToCart(servico: widget.servico),
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
