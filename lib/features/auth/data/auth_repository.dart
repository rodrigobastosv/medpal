import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/errors/auth_error.dart';

class AuthRepository {
  AuthRepository({required FirebaseAuth firebaseAuth, required FirebaseFirestore firebaseFirestore})
    : _firebaseAuth = firebaseAuth,
      _firebaseFirestore = firebaseFirestore;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get usersCollection => _firebaseFirestore.collection('users');

  Stream<bool> get getUserAuthStatus => _firebaseAuth.userChanges().map((user) => user == null);

  Future<void> signIn({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<Result<AuthError, User>> signUp({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = User(userId: userCredential.user!.uid, email: email);
      return Success(user);
    } on FirebaseAuthException catch (exception) {
      return switch (exception.code) {
        'email-already-in-use' => Error(EmailAlreadyInUseAuthError()),
        'invalid-email' => Error(InvalidEmailAuthError()),
        'weak-password' => Error(WeakPasswordAuthError()),
        _ => Error(UnknownAuthError()),
      };
    }
  }

  Future<Result<MPError, void>> addUser({required User user}) async {
    await usersCollection.doc(user.userId).set(user.toJson());
    return const Success(null);
  }
}
