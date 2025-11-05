import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({required FirebaseStorage firebaseStorage}) : _firebaseStorage = firebaseStorage;

  final FirebaseStorage _firebaseStorage;

  Future<String?> uploadFile({required Uint8List file, required String path}) async {
    final storageRef = _firebaseStorage.ref().child(path);
    final uploadTask = await storageRef.putData(file);
    if (uploadTask.state == TaskState.success) {
      return storageRef.getDownloadURL();
    }
    return null;
  }
}
