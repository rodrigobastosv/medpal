import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MPProvider extends StatelessWidget {
  const MPProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
      RepositoryProvider<FirebaseFirestore>(create: (_) => FirebaseFirestore.instance),
    ],
    child: child,
  );
}
