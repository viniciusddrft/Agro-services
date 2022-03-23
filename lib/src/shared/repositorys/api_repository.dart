import '../services/interfaces/service_web_request_interface.dart';
import 'interfaces/api_interface.dart';

class ApiRepository implements ApiInterface {
  final ServiceWebRequestInterface serviceWebRequestInterface;

  ApiRepository(this.serviceWebRequestInterface);
}
