import 'dart:convert';
import 'package:sarang/src/features/authentication/domain/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Checking whether user data was saved or not
class DataUserAccountLocal {
  static const userAccountKey = 'userAccountKey';

  // Get user data from Shared Prefferences
  static getDataUserAccountFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(userAccountKey) ?? '';
    return jsonDecode(result);
  }

  // set user data to Shared Prefferences
  static void setDataUserAccountToStorage(UserAccount userAccount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userAccountKey, jsonEncode(userAccount.toMap()));
  }
}

// Checking whether user registered or not
class UserAccountRegister {
  static const String userAccountRegisterKey = 'userAccountRegister';

  // checking whether user is registered or not
  static Future<bool> getUserAccountRegister() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userAccountRegisterKey) ?? false;
  }

  // set data indicating user was registered
  static void setUserAccountRegister(bool isRegister) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userAccountRegisterKey, isRegister);
  }

  static void userAccountLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userAccountRegisterKey);
  }
}
