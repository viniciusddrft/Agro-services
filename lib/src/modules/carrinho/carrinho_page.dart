import 'package:flutter/material.dart';

import '../../shared/models/produto_model.dart';
import '../../shared/models/servico_model.dart';
import '../../shared/repositorys/api_controller.dart';

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
  List<int> numberInItems = [];
  var mapNumberinIntems = {};

  @override
  void initState() {
    List<Produto> produtosClean = widget.produtos.toSet().toList();
    List<Servico> servicosClean = widget.servicos.toSet().toList();

    items = List.from(produtosClean)..addAll(servicosClean);

    for (Produto produto in widget.produtos) {
      numberInItems.add(produto.id);
    }

    for (Servico servico in widget.servicos) {
      numberInItems.add(servico.id);
    }

    for (var element in numberInItems) {
      if (!mapNumberinIntems.containsKey(element)) {
        mapNumberinIntems[element] = 1;
      } else {
        mapNumberinIntems[element] += 1;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = ApiController();

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
              'items': apiController.numberOfItemsInCart.value,
              'produtos': apiController.produtosInCart,
              'servicos': apiController.servicosInCart,
            }),
            icon: const Icon(Icons.shopping_cart),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: ValueListenableBuilder(
              valueListenable: apiController.numberOfItemsInCart,
              builder: (BuildContext context, int value, Widget? child) =>
                  apiController.numberOfItemsInCart.value > 0
                      ? Text('$value')
                      : Container(),
            ),
          )
        ],
      ),
      body: items.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text('Carrinho de compras'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Seus itens adicionados ao carrinho'),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text('Finalizar compra'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) => items[
                              index] is Produto
                          ? Row(
                              children: [
                                Image.network(items[index].imagem,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? imageChunkEvent) {
                                  if (imageChunkEvent == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          imageChunkEvent.expectedTotalBytes !=
                                                  null
                                              ? imageChunkEvent
                                                      .cumulativeBytesLoaded /
                                                  imageChunkEvent
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                }),
                                Column(
                                  children: [
                                    Text(items[index].nome),
                                    Text(items[index].descricao),
                                    Text(items[index].peso),
                                    Text(items[index].tamanho),
                                    Text(mapNumberinIntems[index].toString())
                                  ],
                                ),
                                Text('${items[index].valor}')
                              ],
                            )
                          : Row(
                              children: [
                                Image.network(items[index].imagem,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? imageChunkEvent) {
                                  if (imageChunkEvent == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          imageChunkEvent.expectedTotalBytes !=
                                                  null
                                              ? imageChunkEvent
                                                      .cumulativeBytesLoaded /
                                                  imageChunkEvent
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                }),
                                Column(
                                  children: [
                                    Text(items[index].nome),
                                    Text(items[index].descricao),
                                    Text(items[index].fornecedor),
                                    Text(items[index].contato),
                                  ],
                                ),
                                Text('${items[index].valor}')
                              ],
                            ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Text('Seu carrinho está vazio'),
            ),
    );
  }
}
