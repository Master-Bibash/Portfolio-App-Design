import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    try {
      Reference ref = _storage.ref().child(childName);
      UploadTask task = ref.putData(file);
      TaskSnapshot snapshot = await task;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return "Some error occurred";
    }
  }

  Future<String> saveImage({required Uint8List file}) async {
    try {
      String imageUrl = await uploadImageToStorage("profileImage", file);
      print("Image uploaded to storage. Image URL: $imageUrl");

      // Create a Firestore document with the image link
      await _firestore.collection('userprofile').add({'imageLink': imageUrl});
      print("Image link saved to Firestore");

      return imageUrl;
    } catch (e) {
      print("Error saving image: $e");
      return "Some error occurred";
    }
  }
}
