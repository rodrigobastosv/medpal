import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/features/auth/data/auth_repository.dart';
import 'package:medpal/features/auth/domain/get_user_auth_status_use_case.dart';

class MPProvider extends StatelessWidget {
  const MPProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider<FirebaseAuth>(create: (context) => FirebaseAuth.instance),
      RepositoryProvider<FirebaseFirestore>(create: (context) => FirebaseFirestore.instance),
      RepositoryProvider<AuthRepository>(create: (context) => AuthRepository(firebaseAuth: context.read())),
      RepositoryProvider<GetUserAuthStatusUseCase>(create: (context) => GetUserAuthStatusUseCase(authRepository: context.read())),
    ],
    child: child,
  );
}
