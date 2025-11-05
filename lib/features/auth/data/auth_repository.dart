import 'package:medpal/core/error/mp_error.dart';
import 'package:medpal/core/utils/result_utils.dart';
import 'package:medpal/features/auth/data/datasources/firebase/auth_firebase_datasource.dart';
import 'package:medpal/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/errors/sign_in_error.dart';
import 'package:medpal/features/auth/domain/errors/sign_up_error.dart';

class AuthRepository {
  AuthRepository({required AuthLocalDatasource authLocalDatasource, required AuthFirebaseDatasource authFirebaseDatasource})
    : _authLocalDatasource = authLocalDatasource,
      _authFirebaseDatasource = authFirebaseDatasource;

  final AuthLocalDatasource _authLocalDatasource;
  final AuthFirebaseDatasource _authFirebaseDatasource;

  Stream<bool> get getUserAuthStatus => _authFirebaseDatasource.getUserAuthStatus;

  Future<void> storeUser(AuthenticatedUser user) => _authLocalDatasource.saveUser(user);

  User getUser() => _authLocalDatasource.getUser();

  Future<Result<SignUpError, AuthenticatedUser>> signUp({
    required String? profilePhotoUrl,
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) => _authFirebaseDatasource.signUp(profilePhotoUrl: profilePhotoUrl, name: name, lastName: lastName, email: email, password: password);

  Future<Result<MPError, void>> addUser({required AuthenticatedUser user}) => _authFirebaseDatasource.addUser(user: user);

  Future<Result<SignInError, AuthenticatedUser>> signIn({required String email, required String password}) =>
      _authFirebaseDatasource.signIn(email: email, password: password);
}
