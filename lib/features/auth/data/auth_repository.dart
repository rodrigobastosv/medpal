import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/datasources/firebase/auth_firebase_datasource.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/errors/sign_in_error.dart';
import 'package:medpal/features/auth/domain/errors/sign_up_error.dart';

class AuthRepository {
  AuthRepository({required AuthFirebaseDatasource authFirebaseDatasource}) : _authFirebaseDatasource = authFirebaseDatasource;

  final AuthFirebaseDatasource _authFirebaseDatasource;

  Stream<bool> get getUserAuthStatus => _authFirebaseDatasource.getUserAuthStatus;

  Future<Result<SignUpError, User>> signUp({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) => _authFirebaseDatasource.signUp(name: name, lastName: lastName, email: email, password: password);

  Future<Result<MPError, void>> addUser({required User user}) => _authFirebaseDatasource.addUser(user: user);

  Future<Result<SignInError, User>> signIn({required String email, required String password}) =>
      _authFirebaseDatasource.signIn(email: email, password: password);
}
