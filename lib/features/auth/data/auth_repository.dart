import 'package:firebase_auth/firebase_auth.dart';
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';

class AuthRepository {
  AuthRepository({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Stream<bool> get getUserAuthStatus => _firebaseAuth.userChanges().map((user) => user == null);

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<Result<MPError, void>> signUp({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return const Success(null);
  }
}
