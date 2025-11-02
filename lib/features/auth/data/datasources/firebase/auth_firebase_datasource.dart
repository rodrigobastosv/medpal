import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/errors/sign_in_error.dart';
import 'package:medpal/features/auth/domain/errors/sign_up_error.dart';

class AuthFirebaseDatasource {
  AuthFirebaseDatasource({required FirebaseAuth firebaseAuth, required FirebaseFirestore firebaseFirestore})
    : _firebaseAuth = firebaseAuth,
      _firebaseFirestore = firebaseFirestore;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  CollectionReference get usersCollection => _firebaseFirestore.collection('users');

  Stream<bool> get getUserAuthStatus => _firebaseAuth.userChanges().map((user) => user == null);

  Future<Result<SignUpError, User>> signUp({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      final user = User(userId: userCredential.user!.uid, name: name, lastName: lastName, email: email);
      return Success(user);
    } on FirebaseAuthException catch (exception) {
      return switch (exception.code) {
        'email-already-in-use' => Error(EmailAlreadyInUseSignUpError()),
        'invalid-email' => Error(InvalidEmailSignUpError()),
        'weak-password' => Error(WeakPasswordSignUpError()),
        _ => Error(UnknownSignUpError()),
      };
    }
  }

  Future<Result<MPError, void>> addUser({required User user}) async {
    await usersCollection.doc(user.userId).set(user.toJson());
    return const Success(null);
  }

  Future<Result<SignInError, User>> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return Error(UnknownSignInError());
      }

      final userDocument = await usersCollection.doc(firebaseUser.uid).get();
      final userData = userDocument.data();
      if (userData == null) {
        return Error(UnknownSignInError());
      }

      final user = User.fromJson(userData as Map<String, dynamic>);
      return Success(user);
    } on FirebaseAuthException catch (exception) {
      return switch (exception.code) {
        'invalid-email' => Error(InvalidEmailSignInError()),
        'user-disabled' => Error(UserDisabledSignInError()),
        'user-not-found' => Error(UserNotFoundSignInError()),
        'invalid-credential' => Error(InvalidCredentialsSignInError()),
        'wrong-password' => Error(WrongPasswordSignInError()),
        _ => Error(UnknownSignInError()),
      };
    }
  }
}
