import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationProvider extends ChangeNotifier {
  static FirebaseAuth auth = FirebaseAuth.instance;
  User? get credential => auth.currentUser;

  void setCredential(User? value) {
    notifyListeners();
  }
}
