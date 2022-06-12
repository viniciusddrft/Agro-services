import 'package:flutter/material.dart';

import '../../shared/models/produto_model.dart';
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
  List<int> numberInItemsProdutos = [];
  var mapNumberinIntemsProdutos = {};
  List<int> numberInItemsServicos = [];
  var mapNumberinIntemsServicos = {};
  double valueTotal = 0;
  @override
  void initState() {
    List<Produto> produtosClean = widget.produtos.toSet().toList();
    List<Servico> servicosClean = widget.servicos.toSet().toList();

    items = List.from(produtosClean)..addAll(servicosClean);

    for (Produto produto in widget.produtos) {
      numberInItemsProdutos.add(produto.id);
      valueTotal += produto.valor;
    }

    for (Servico servico in widget.servicos) {
      numberInItemsServicos.add(servico.id);
      valueTotal += servico.valor;
    }

    for (var element in numberInItemsProdutos) {
      if (!mapNumberinIntemsProdutos.containsKey(element)) {
        mapNumberinIntemsProdutos[element] = 1;
      } else {
        mapNumberinIntemsProdutos[element] += 1;
      }
    }

    for (var element in numberInItemsServicos) {
      if (!mapNumberinIntemsServicos.containsKey(element)) {
        mapNumberinIntemsServicos[element] = 1;
      } else {
        mapNumberinIntemsServicos[element] += 1;
      }
    }

    super.initState();
  }

  double getValor(int length, double price) => price * length;

  void removeItem(Map<dynamic, dynamic> value, int key, double price) =>
      setState(() {
        if (value[key] >= 1) {
          value[key] -= 1;
          valueTotal -= price;
        }
      });

  void addItem(Map<dynamic, dynamic> value, int key, double price) =>
      setState(() {
        value[key] += 1;
        valueTotal += price;
      });

  void getTotalValue() {}

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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Finalizar compra'),
                                ),
                              ),
                            ),
                            Text('Preço total: $valueTotal')
                          ],
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 300, bottom: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Titulo :${items[index].nome}'),
                                      Text(
                                          'Descrição :${items[index].descricao}'),
                                      Text('Peso :${items[index].peso}'),
                                      Text('Tamanho :${items[index].tamanho}'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                removeItem(
                                                    mapNumberinIntemsProdutos,
                                                    index,
                                                    items[index].valor);
                                              },
                                              icon: const Icon(Icons.remove)),
                                          Text(
                                              'Quantidade :${mapNumberinIntemsProdutos[index]}'),
                                          IconButton(
                                              onPressed: () {
                                                addItem(
                                                    mapNumberinIntemsProdutos,
                                                    index,
                                                    1);
                                              },
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ),
                                      Text(
                                          'preço :${getValor(mapNumberinIntemsProdutos[index], items[index].valor)}'),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 300, bottom: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nome :${items[index].nome}'),
                                      Text(
                                          'Descrição :${items[index].descricao}'),
                                      Text(
                                          'Fornecedor :${items[index].fornecedor}'),
                                      Text('Contato :${items[index].contato}'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                removeItem(
                                                    mapNumberinIntemsServicos,
                                                    index,
                                                    items[index].valor);
                                              },
                                              icon: const Icon(Icons.remove)),
                                          Text(
                                              'Quantidade :${mapNumberinIntemsServicos[index - mapNumberinIntemsProdutos.length]}'),
                                          IconButton(
                                              onPressed: () {
                                                addItem(
                                                    mapNumberinIntemsServicos,
                                                    index,
                                                    items[index].valor);
                                              },
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ),
                                      Text(
                                          'preço :${getValor(mapNumberinIntemsServicos[index - mapNumberinIntemsProdutos.length], items[index].valor)}'),
                                    ],
                                  ),
                                )
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
