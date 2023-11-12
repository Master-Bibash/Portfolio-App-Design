import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageProvider with ChangeNotifier{
  XFile? filePath;
  void selectImage(XFile file){
    filePath=file;
    notifyListeners();
  }
}

