import 'package:flutter/cupertino.dart';

class changeIndex with ChangeNotifier{
  int currentIndex=0;
  void setCurrentIndex(int index){
    this.currentIndex = index;
    notifyListeners();
  }
}