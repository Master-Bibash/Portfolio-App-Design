import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reusableSnackbar{
  static showSnackBar(BuildContext context,String message){
    final snackBar=SnackBar(content: Text(message),
    duration: Duration(seconds: 1),
    behavior: SnackBarBehavior.fixed,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}