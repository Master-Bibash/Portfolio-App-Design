import 'package:flutter/material.dart';

class DateSelectorProvider with ChangeNotifier{
  String currentDate=DateTime(DateTime.now().year,DateTime.now().month,
  DateTime.now().day).toString().substring(0,10);
  void changeCurrentDate(String selectedDate){
    currentDate=selectedDate;
    notifyListeners();
  }
}