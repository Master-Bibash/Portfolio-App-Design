// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:projject/common/reusablealert.dart';
// import 'package:projject/controller/auth_controller.dart';
// import 'package:sn_progress_dialog/sn_progress_dialog.dart';

// class user{
//   FirebaseFirestore firestore=FirebaseFirestore.instance;
//   adduserDetails(
//     String name,
//     String date,
//     String phone,
//     String address,
//     String education,
//     BuildContext context, 
//   TextEditingController nameController,
//   TextEditingController dateController,
//   TextEditingController phoneController,
//   TextEditingController addressController,
//   TextEditingController educationController


//   )async{
//     try {
//      ProgressDialog p=ProgressDialog(context: context);
//      p.show();
//      await firestore.collection(auth.currentUser!.uid).doc().set({
//      "name": nameController.text,
//       "date": dateController.text,
//       "phone": phoneController.text,
//       "address": addressController.text,
//       "education": educationController.text,
//      }).then((value) {
//       ProgressDialog(context: context);
//       reusableSnackbar.showSnackBar(context,"user added");
//       nameController.clear();
//       dateController.clear();
//       phoneController.clear();
//       addressController.clear();
//       educationController.clear();


//      });
      
//     } catch (e) {
      
//     }
//   }

//   updateEntry(
//     String name,
//     String date,
//     String phone,
//     String address,
//     String education,
//     String id,
//     BuildContext context,
//   ){
//     firestore.collection(auth.currentUser!.uid).doc(id).update({
//       'name': name,
//       'date' : date ,
//       'phone' : phone ,
//     }).then((value){
//       reusableSnackbar.showSnackBar(context, "data updated");
//       Navigator.of(context).pop();
//     }).onError((error, stackTrace){
//       reusableSnackbar.showSnackBar(context, "Error has come");
//     });
//   }
// }