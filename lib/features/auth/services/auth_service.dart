import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../config/app_constants.dart';
import '../../../core/models/user_model.dart';
import '../../../core/services/api_service.dart';

class AuthService extends GetxService {
  final ApiService _apiService = ApiService();
  final GetStorage _storage = GetStorage();
  
  // Observable user data
  final Rx<User?> _user = Rx<User?>(null);
  
  // Getters
  User? get user => _user.value;
  bool get isLoggedIn => _apiService.isLoggedIn;
  Stream<User?> get userStream => _user.stream;
  
  // Initialize the service
  Future<AuthService> init() async {
    // Initialize GetStorage
    await GetStorage.init();
    
    // Load user data if available
    final userData = _storage.read<Map<String, dynamic>>(AppConstants.userKey);
    if (userData != null) {
      _user.value = User.fromJson(userData);
    }
    
    return this;
  }
  
  // Login
  Future<User> login(String email, String password) async {
    try {
      final user = await _apiService.login(email, password);
      _saveUserData(user);
      return user;
    } catch (e) {
      rethrow;
    }
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
    try {
      final user = await _apiService.register(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone,
        shopName: shopName,
      );
      _saveUserData(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }
  
  // Logout
  Future<void> logout() async {
    try {
      await _apiService.logout();
      _clearUserData();
    } catch (e) {
      _clearUserData();
      rethrow;
    }
  }
  
  // Save user data
  void _saveUserData(User user) {
    _user.value = user;
    _storage.write(AppConstants.userKey, user.toJson());
  }
  
  // Clear user data
  void _clearUserData() {
    _user.value = null;
    _storage.remove(AppConstants.userKey);
  }
}