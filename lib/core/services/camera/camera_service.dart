import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class CameraService {
  CameraService({required ImagePicker imagePicker}) : _imagePicker = imagePicker;

  final ImagePicker _imagePicker;

  Future<Uint8List?> takePicture() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return null;
    }
    return pickedFile.readAsBytes();
  }
}
