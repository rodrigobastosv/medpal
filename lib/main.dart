import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medpal/core/app/mp_app.dart';
import 'package:medpal/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MPApp(sharedPreferences: sharedPreferences));
}
