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
  void getProducts(Map<String, dynamic> json) {
    // TODO: implement getProducts
  }

  @override
  void getServices(Map<String, dynamic> json) {
    // TODO: implement getServices
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
