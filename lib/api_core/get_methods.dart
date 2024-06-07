import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiMethods {
  static String? xApiKey;

  Future<Map<String, dynamic>> getMethod({
    String? url,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.get(
        Uri.parse(url ?? ""),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMethodWithToken({
    String? url,
    var token,
  }) async {
    try {
      var response = await http.get(
        Uri.parse(url ?? ""),
        headers: (xApiKey ?? "").isNotEmpty
            ? {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
                'x-api-key': (xApiKey ?? ""),
              }
            : {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              },
      );
      return _handleResponse(response);
    } catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postMethod({
    String? url,
    Map<String, String>? headers,
    var body,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(url ?? ""),
        headers: headers,
        body: body,
      );
      return _handleResponse(response);
    } catch (error, stackTrace) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postMethodWithToken({
    String? url,
    var token,
    var body,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(url ?? ""),
        headers: (xApiKey ?? "").isNotEmpty
            ? {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
                'x-api-key': (xApiKey ?? ""),
              }
            : {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              },
        body: body,
      );
      return _handleResponse(response);
    } catch (error, stackTrace) {
      rethrow;
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
  }
}
