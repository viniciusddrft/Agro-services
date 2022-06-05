import 'package:agro_services/src/shared/models/carrosel_model.dart';
import 'package:agro_services/src/shared/models/produto_model.dart';
import 'package:agro_services/src/shared/models/servico_model.dart';
import 'package:agro_services/src/shared/services/service_web_request_http.dart';
import 'package:flutter/material.dart';

import '../../shared/repositorys/api_repository.dart';

class HomeController {
  static final HomeController _instancia = HomeController._();

  HomeController._();

  factory HomeController() => _instancia;

  final ApiRepository apiRepository = ApiRepository(ServiceWebHttp());
  final ValueNotifier<int> numberOfItemsInCart = ValueNotifier<int>(0);

  late final List<Servico> servicos;
  late final List<Produto> produtos;
  late final Carrosel carrosel;

  final List<Servico> servicosInCart = [];
  final List<Produto> produtosInCart = [];

  void addToCart({Produto? produto, Servico? servico}) {
    numberOfItemsInCart.value++;
    if (produto != null) {
      produtosInCart.add(produto);
    } else if (servico != null) {
      servicosInCart.add(servico);
    }
  }

  Future<void> getAllprodutos() async =>
      produtos = await apiRepository.getProducts();

  Future<void> getAllservicos() async =>
      servicos = await apiRepository.getServices();

  Future<void> getCarrosel() async =>
      carrosel = await apiRepository.getCarrosel();
}
