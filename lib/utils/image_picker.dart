import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> pickImageFromCamera() async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.camera);
    return file != null ? File(file.path) : null;
  }

  Future<File?> pickImageFromGallery() async {
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return file != null ? File(file.path) : null;
  }
}
