import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../config/app_constants.dart';
import '../models/user_model.dart';

class ApiService {
  final GetStorage _storage = GetStorage();
  
  // Get the authentication token
  String? get token => _storage.read<String>(AppConstants.tokenKey);
  
  // Set the authentication token
  set token(String? value) {
    if (value != null) {
      _storage.write(AppConstants.tokenKey, value);
    } else {
      _storage.remove(AppConstants.tokenKey);
    }
  }
  
  // Check if user is logged in
  bool get isLoggedIn => token != null;
  
  // Get the base HTTP headers
  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };
  
  // Handle HTTP response
  dynamic _handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    final dynamic body = json.decode(response.body);
    
    if (statusCode >= 200 && statusCode < 300) {
      return body;
    } else if (statusCode == 401) {
      // Unauthorized - clear token and redirect to login
      token = null;
      Get.offAllNamed('/sign-in');
      throw Exception(body['message'] ?? 'Unauthorized');
    } else {
      throw Exception(body['message'] ?? 'Error occurred with status code: $statusCode');
    }
  }
  
  // GET request
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse(endpoint),
      headers: _headers,
    );
    return _handleResponse(response);
  }
  
  // POST request
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: _headers,
      body: data != null ? json.encode(data) : null,
    );
    return _handleResponse(response);
  }
  
  // PUT request
  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
    final response = await http.put(
      Uri.parse(endpoint),
      headers: _headers,
      body: data != null ? json.encode(data) : null,
    );
    return _handleResponse(response);
  }
  
  // DELETE request
  Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse(endpoint),
      headers: _headers,
    );
    return _handleResponse(response);
  }
  
  // Login
  Future<User> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    
    final response = await post(AppConstants.loginEndpoint, data: data);
    
    // Save token
    token = response['token'];
    
    // Return user data
    return User.fromJson(response['user']);
  }
  
  // Register
  Future<User> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String? phone,
    String? shopName,
  }) async {
    final data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      if (phone != null) 'phone': phone,
      if (shopName != null) 'shop_name': shopName,
    };
    
    final response = await post(AppConstants.registerEndpoint, data: data);
    
    // Save token
    token = response['token'];
    
    // Return user data
    return User.fromJson(response['user']);
  }
  
  // Logout
  Future<void> logout() async {
    // Clear token
    token = null;
    
    // Navigate to login screen
    Get.offAllNamed('/sign-in');
  }
}