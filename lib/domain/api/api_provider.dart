import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiProvider({required this.appBaseUrl}) {
    token = ""; //Добавить сохранение данных через hive
    _mainHeaders = {
      'Content-type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void startLoading() {
    _isLoading = true;
  }

  void stopLoading() {
    _isLoading = false;
  }

  void updateToken(String newToken) {
    token = newToken;
    _mainHeaders['Authorization'] = 'Bearer $token';
  }

  Future<http.Response> getData(String uri, {Map<String, String>? headers}) async {
    startLoading();
    try {
      //print("getData = $headers");
      http.Response response = await http.get(Uri.parse(uri), headers: headers ?? _mainHeaders);
      //print("getData2 = ${response.body}");
      stopLoading();
      return response;
    } catch (e) {
      stopLoading();
      return http.Response('Error: $e', 500);
    }
  }

  Future<http.Response> postData(String uri, dynamic body) async {
    startLoading();
    try {
      http.Response response = await http.post(Uri.parse(uri), body: json.encode(body), headers: _mainHeaders);
      //print(response.body);
      stopLoading();
      return response;
    } catch (e) {
      stopLoading();
      print('Error api client');
      print(e.toString());
      return http.Response('Error: $e', 500);
    }
  }

  Future<void> handleResponseError(http.Response response) async {
    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode >= 500) {
      throw Exception('Server error occurred');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized access');
    } else {
      final dynamic responseData = json.decode(response.body);
      final String errorMessage = responseData['message'] ?? 'Unknown error';
      throw Exception(errorMessage);
    }
  }
}
