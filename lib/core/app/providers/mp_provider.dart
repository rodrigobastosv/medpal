import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medpal/core/app/providers/cubit_providers.dart';
import 'package:medpal/core/app/providers/firebase_providers.dart';
import 'package:medpal/core/app/providers/repository_providers.dart';
import 'package:medpal/core/app/providers/service_providers.dart';
import 'package:medpal/core/app/providers/use_case_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MPProvider extends StatelessWidget {
  const MPProvider({required this.prefs, required this.child, super.key});

  final SharedPreferences prefs;
  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [...serviceProviders(prefs), ...firebaseProviders(), ...repositoryProviders(), ...useCaseProviders(), ...cubitProviders()],
    child: child,
  );
}
