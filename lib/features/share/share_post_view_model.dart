import 'dart:io';

import 'package:firebase_project/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SharePostViewModel extends BaseViewModel {
  SharePostViewModel._();

  static final SharePostViewModel _instance = SharePostViewModel._();
  static SharePostViewModel get instance => _instance;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  String? imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImageGallery() async {
    XFile? xfileGallery =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (xfileGallery != null) {
      imagePath = xfileGallery.path;
      notifyListeners();
    }
  }

  Future<void> pickImageCamera() async {
    XFile? xfileCamera =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (xfileCamera != null) {
      imagePath = xfileCamera.path;
    }

    notifyListeners();
  }
}
