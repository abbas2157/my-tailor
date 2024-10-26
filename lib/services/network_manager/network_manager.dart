import 'dart:async';
import 'dart:convert'; // For JSON encoding/decoding
import 'package:http/http.dart' as http; // For HTTP requests
import 'dart:io'; // For handling socket exceptions

class NetworkManager {
  static const String _baseUrl =
      'http://tailor.alraiclothes.pk/api/'; // Base URL for your API
  static const int _timeoutDuration = 10; // Timeout duration in seconds

  // Singleton pattern to ensure only one instance of NetworkManager
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;
  NetworkManager._internal();

  // Common method to handle all HTTP responses and errors
  Future<dynamic> _handleResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body); // Successfully parsed response
      case 400:
        throw Exception('Bad request');
      case 401:
        throw Exception('Unauthorized');
      case 403:
        throw Exception('Forbidden');
      case 404:
        throw Exception('Not Found');
      case 500:
        throw Exception('Internal Server Error');
      default:
        throw Exception('Unexpected error: ${response.statusCode}');
    }
  }

  // GET request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http
          .get(
            Uri.parse('$_baseUrl$endpoint'),
            headers: headers,
          )
          .timeout(
              const Duration(seconds: _timeoutDuration)); // Timeout handling

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on http.ClientException {
      throw Exception('Client error');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // POST request
  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl$endpoint'),
            headers: headers,
            body: jsonEncode(body), // Encode the body as JSON
          )
          .timeout(const Duration(seconds: _timeoutDuration));

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // PUT request
  Future<dynamic> put(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http
          .put(
            Uri.parse('$_baseUrl$endpoint'),
            headers: headers,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: _timeoutDuration));

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // DELETE request
  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final response = await http
          .delete(
            Uri.parse('$_baseUrl$endpoint'),
            headers: headers,
          )
          .timeout(const Duration(seconds: _timeoutDuration));

      return _handleResponse(response);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
