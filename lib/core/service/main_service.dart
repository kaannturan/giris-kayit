import "package:http/http.dart" as http;

class MainService {
  MainService._();

  static final MainService instance = MainService._();
  factory MainService() => instance;

  var headers = {'x-api-key': 'reqres-free-v1'};
  final String baseUrl = "https://reqres.in/api/";

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint), headers: headers);
    return response;
  }

  Future<http.Response> post({required String endpoint, required Map<String, dynamic> body}) async {
    final response = await http.post(Uri.parse(baseUrl + endpoint), headers: headers, body: body);
    return response;
  }
}
