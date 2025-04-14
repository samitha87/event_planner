import 'package:event_planner/data/models/user_data_model.dart';
import 'package:event_planner/domain/use_cases/auth_case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends AuthCase {
  final FirebaseAuth _auth;

  AuthService({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailAndPassword(UserDataModel userData) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: userData.email!, password: userData.password!);
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuth error: ${e.code} - ${e.message}");
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<User?> signUpWithEmailAndPassword(UserDataModel userData) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: userData.email!, password: userData.password!);
      return result.user;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuth error: ${e.code} - ${e.message}");
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }
}
