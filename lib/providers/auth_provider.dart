import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<bool> login(String username, String password) async {
    // ici tu mets ta logique d'auth, exemple simple :
    if (username == "oussbi" && password == "123456") {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
