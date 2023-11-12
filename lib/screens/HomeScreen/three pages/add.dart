import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projject/common/widgets/dateselector.dart';
import 'package:projject/common/widgets/image_picking.dart';
import 'package:projject/controller/auth_controller.dart';
import 'package:projject/provider/profileImageProvider.dart';
import 'package:provider/provider.dart';

class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController experienceController = TextEditingController();
  TextEditingController skillsController = new TextEditingController();
  TextEditingController workingPeriodController = new TextEditingController();
  TextEditingController hobbiesController = new TextEditingController();
  TextEditingController aboutController = new TextEditingController();
  final db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Form(
                  key: globalKey,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        textformfieldwidgets(
                            controller: experienceController,
                            icon: Icons.person,
                            text: "Experience"),
                     
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        textformfieldwidgets(
                            controller: skillsController,
                            icon: Icons.phone,
                            text: "Skills"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                          textformfieldwidgets(
                            controller: workingPeriodController,
                            icon: Icons.phone,
                            text: "working period"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                          textformfieldwidgets(
                            controller: hobbiesController,
                            icon: Icons.phone,
                            text: "hobbies"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                          textformfieldwidgets(
                            controller: aboutController,
                            icon: Icons.phone,
                            text: "about"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          height: size.height * 0.07,
                          width: size.width,
                          margin:
                              EdgeInsets.only(left: 40, right: 40, bottom: 25),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () async {
                                final userCollection = db.collection('user');
                                // Query to check if the document exists using the user's email
                                final userDoc = await userCollection
                                    .where('email',
                                        isEqualTo: _auth.currentUser?.email)
                                    .get();

                                if (userDoc.docs.isNotEmpty) {
                                  // If the document exists, update it
                                  userCollection
                                      .doc(userDoc.docs.first.id)
                                      .update({
                                    'experience': experienceController.text,
                                    'skills': skillsController.text,
                                    'workingperiod':
                                        workingPeriodController.text,
                                    'hobbies': hobbiesController.text,
                                    'about': aboutController.text,
                                  });
                                } else {
                                  // If the document doesn't exist, create a new one
                                  await db.collection('user').add({
                                    'experience': experienceController.text,
                                    'skills': skillsController.text,
                                    'workingperiod':
                                        workingPeriodController.text,
                                    'hobbies': hobbiesController.text,
                                    'about': aboutController.text,
                                    'email': _auth.currentUser
                                        ?.email, // Unique identifier (change to your unique identifier)
                                  });
                                }
                              },
                              // Button styling and text

                              child: Text(
                                "Save",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class textformfieldwidgets extends StatelessWidget {
  const textformfieldwidgets({
    super.key,
    required this.controller,
    required this.icon,
    required this.text,
  });
  final TextEditingController controller;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: TextFormField(
 maxLines: 5,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your ${text}';
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          hintText: "ENter your ${text}",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
