import 'dart:convert';

import 'package:agro_services/src/shared/mock/api_mock.dart';
import 'package:agro_services/src/shared/models/produto_model.dart';

import '../models/servico_model.dart';
import '../services/interfaces/service_web_request_interface.dart';
import 'interfaces/api_interface.dart';

class ApiRepository implements ApiInterface {
  @override
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiRepository(this.serviceWebRequestInterface);

  @override
  void addProducts(Map<String, dynamic> json) {
    // TODO: implement addProducts
  }

  @override
  void addServices(Map<String, dynamic> json) {
    // TODO: implement addServices
  }

  @override
  void deleteProducts(Map<String, dynamic> json) {
    // TODO: implement deleteProducts
  }

  @override
  void deleteServices(Map<String, dynamic> json) {
    // TODO: implement deleteServices
  }

  @override
  Future<List<Produto>> getProducts() async {
    /*final ServiceWebResponseInterface respose = await serviceWebRequestInterface
        .get('http://localhost:8080/api/produto/', headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          "true", // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
*/
    // final json = jsonDecode(respose.body) as Map<String, dynamic>;

    final String jsonRaw = ApiMock().jsonGetProdutos();
    final jsonAll = jsonDecode(jsonRaw) as List;
    final List<Produto> listaDeProdutos = [];
    for (int i = 0; i != jsonAll.length; i++) {
      listaDeProdutos.add(Produto.fromJson(jsonAll[i]));
    }

    return listaDeProdutos;
  }

  @override
  Future<List<Servico>> getServices() async {
    final String jsonRaw = ApiMock().jsonGetServicos();
    final jsonAll = jsonDecode(jsonRaw) as List;
    final List<Servico> listaDeServicos = [];
    for (int i = 0; i != jsonAll.length; i++) {
      listaDeServicos.add(Servico.fromJson(jsonAll[i]));
    }

    return listaDeServicos;
  }

  @override
  void login(Map<String, dynamic> json) {
    // TODO: implement login
  }

  @override
  void purchase(Map<String, dynamic> json) {
    // TODO: implement purchase
  }

  @override
  void register(Map<String, dynamic> json) {
    // TODO: implement register
  }
}
