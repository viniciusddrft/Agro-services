import '../../services/interfaces/service_web_request_interface.dart';

abstract class ApiInterface {
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiInterface(this.serviceWebRequestInterface);

  void login(Map<String, dynamic> json);

  void register(Map<String, dynamic> json);

  void purchase(Map<String, dynamic> json);

  void getProducts(Map<String, dynamic> json);

  void addProducts(Map<String, dynamic> json);

  void deleteProducts(Map<String, dynamic> json);

  void getServices(Map<String, dynamic> json);

  void addServices(Map<String, dynamic> json);

  void deleteServices(Map<String, dynamic> json);
}
