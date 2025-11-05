import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medpal/core/services/camera/camera_service.dart';
import 'package:medpal/core/services/local_storage/local_storage_service.dart';
import 'package:medpal/core/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<RepositoryProvider> serviceProviders(SharedPreferences prefs) => [
  RepositoryProvider<LocalStorageService>(create: (context) => LocalStorageService(prefs: prefs)),
  RepositoryProvider<CameraService>(create: (context) => CameraService(imagePicker: ImagePicker())),
  RepositoryProvider<StorageService>(create: (context) => StorageService(firebaseStorage: FirebaseStorage.instance)),
];
