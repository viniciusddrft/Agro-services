import '../services/interfaces/service_web_request_interface.dart';
import 'interfaces/api_interface.dart';

class ApiRepository implements ApiInterface {
  @override
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiRepository(this.serviceWebRequestInterface);

  @override
  void cadastro() {
    serviceWebRequestInterface.get('https://www.google.com.br/');
  }

  @override
  void login() {
    serviceWebRequestInterface.get('https://www.google.com.br/');
  }
}
