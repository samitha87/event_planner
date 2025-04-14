import 'package:event_planner/data/models/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthCase {
  Future<User?> signInWithEmailAndPassword(UserDataModel userData);
  Future<void> signOut();
  Future<User?> signUpWithEmailAndPassword(UserDataModel userData);
}
