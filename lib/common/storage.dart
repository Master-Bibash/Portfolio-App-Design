import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
    String fileNae,
  ) async {
    File file = File(filePath);
    try {
      await storage.ref('test/$fileNae').putFile(file);
    } on firebase_core.Firebase catch (e) {
      print(e);
    }
  }
}
