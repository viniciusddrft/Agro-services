import '../../services/interfaces/service_web_request_interface.dart';

abstract class ApiInterface {
  final ServiceWebRequestInterface serviceWebRequestInterface;

  const ApiInterface(this.serviceWebRequestInterface);

  void login();

  void cadastro();
}
