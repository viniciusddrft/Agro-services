import 'package:agro_services/src/shared/models/produto_model.dart';

import '../../models/carrosel_model.dart';
import '../../models/servico_model.dart';
import '../../services/interfaces/service_web_request_interface.dart';

abstract class ApiInterface {
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiInterface(this.serviceWebRequestInterface);

  Future<List<Produto>> getProducts();

  Future<List<Servico>> getServices();

  Future<Carrosel> getCarrosel();

  Future<bool> isLogged();
}
