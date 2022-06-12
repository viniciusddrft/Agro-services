import 'package:agro_services/src/modules/home/home_controller.dart';
import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:flutter/material.dart';

import '../../shared/models/servico_model.dart';

class CarrinhoPage extends StatefulWidget {
  final List<Produto> produtos;
  final List<Servico> servicos;

  const CarrinhoPage(
      {super.key, required this.produtos, required this.servicos});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  late final List<dynamic> items;

  @override
  void initState() {
    items = List.from(widget.produtos)..addAll(widget.servicos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();

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
              onTap: () => Navigator.pushNamed(context, '/produtospage'),
              child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 50),
                child: Text('Produtos'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/servicospage'),
              child: const Text('Serviços'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 400),
              child: SizedBox(
                width: 250,
                height: 40,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5, left: 2),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: '',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      Container(
                        height: 50,
                        width: 41,
                        color: Colors.green.shade300,
                        child: Center(
                          child: IconButton(
                            hoverColor: Colors.white,
                            focusColor: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Carrinho de compras'),
            Row(
              children: [
                const Text('Seus itens adicionados ao carrinho'),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Image.network(widget.produtos[index].imagem, loadingBuilder:
                        (BuildContext context, Widget child,
                            ImageChunkEvent? imageChunkEvent) {
                      if (imageChunkEvent == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: imageChunkEvent.expectedTotalBytes != null
                              ? imageChunkEvent.cumulativeBytesLoaded /
                                  imageChunkEvent.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
                    Column(
                      children: [
                        Text(widget.produtos[index].nome),
                        Text(widget.produtos[index].descricao),
                        Text(widget.produtos[index].peso),
                        Text(widget.produtos[index].tamanho)
                      ],
                    ),
                    Text('${widget.produtos[index].valor}')
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
