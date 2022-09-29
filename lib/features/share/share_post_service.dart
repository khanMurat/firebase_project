import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class SharePostService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImg(File file) async {
    final path =
        '${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}';

    final task = await _storage.ref().child(path).putFile(file);

    return task.ref.getDownloadURL();
  }
}
