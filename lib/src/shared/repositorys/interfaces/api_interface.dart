import 'package:agro_services/src/shared/models/produto_model.dart';

import '../../models/servico_model.dart';
import '../../services/interfaces/service_web_request_interface.dart';

abstract class ApiInterface {
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiInterface(this.serviceWebRequestInterface);

  void login(Map<String, dynamic> json);

  void register(Map<String, dynamic> json);

  void purchase(Map<String, dynamic> json);

  Future<List<Produto>> getProducts();

  void addProducts(Map<String, dynamic> json);

  void deleteProducts(Map<String, dynamic> json);

  Future<List<Servico>> getServices();

  void addServices(Map<String, dynamic> json);

  void deleteServices(Map<String, dynamic> json);
}
