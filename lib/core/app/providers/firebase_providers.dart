import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> firebaseProviders() => [
  RepositoryProvider<FirebaseAuth>(create: (context) => FirebaseAuth.instance),
  RepositoryProvider<FirebaseFirestore>(create: (context) => FirebaseFirestore.instance),
];
