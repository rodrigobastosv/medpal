import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/bootstrap/data/bootstrap_repository.dart';
import 'package:medpal/features/welcome/data/welcome_repository.dart';

List<RepositoryProvider> repositoryProviders() => [
  RepositoryProvider<BootstrapRepository>(create: (context) => BootstrapRepository(localStorageService: context.read())),
  RepositoryProvider<WelcomeRepository>(create: (context) => WelcomeRepository(localStorageService: context.read())),
  RepositoryProvider<AuthRepository>(create: (context) => AuthRepository(firebaseAuth: context.read(), firebaseFirestore: context.read())),
];
