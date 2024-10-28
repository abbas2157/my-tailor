import 'package:my_tailor/local-storage_services/shared_preferences.dart';

class LocalStorageMethods {
  LocalStorageMethods._();
  static final instance = LocalStorageMethods._();

  //// current address
  Future<void> writeUserEmail(String email) async {
    await Prefs.setString("emailKey", email);
  }

  String? getUserEmail() {
    String? email = Prefs.getString("emailKey");
    return email;
  }

  Future<void> writeUserID(String userID) async {
    await Prefs.setString("userID", userID);
  }

  String? getUserId() {
    String? id = Prefs.getString("userID");
    return id;
  }

  Future<bool> clearLocalStorage() async {
    bool? result = await Prefs.clear();
    return result ?? false;
  }
}
