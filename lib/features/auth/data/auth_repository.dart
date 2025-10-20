import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Stream<bool> get getUserAuthStatus => _firebaseAuth.userChanges().map((user) => user == null);

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}
