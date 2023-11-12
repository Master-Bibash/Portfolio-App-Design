import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projject/common/widgets/dateselector.dart';
import 'package:projject/common/widgets/image_picking.dart';
import 'package:projject/controller/auth_controller.dart';
import 'package:projject/provider/profileImageProvider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Placeholder for _image, make sure to replace it with the actual variable

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController currentAddressController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController EducationsController = new TextEditingController();

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final Storage storage = Storage();
    DateSelectorProvider dateSelectProvider =
        Provider.of<DateSelectorProvider>(context, listen: false);
    AuthController authController = AuthController();
    FirebaseAuth _auth = FirebaseAuth.instance;
    String userEmail = _auth.currentUser?.email ?? "Guest";

    final db = FirebaseFirestore.instance;

    DateTime? selectedDate; // Declare selectedDate variable here

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    padding: EdgeInsets.only(top: 5, right: 5),
                    onPressed: () {},
                    icon: Icon(Icons.logout_outlined)),
              ),
              Consumer<ProfileImageProvider>(
                builder: (context, value, child) {
                  return value.filePath == null
                      ? CircleAvatar(
                          radius: 84,
                          backgroundImage:
                              AssetImage("assets/images/person.png"),
                        )
                      : CircleAvatar(
                          radius: 84,
                          backgroundImage: FileImage(File(
                            value.filePath!.path,
                          )),
                        );
                },
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              SizedBox(
                width: size.width * 0.40,
                height: size.height * 0.062,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {
                      ImagePickProfile.BottomSheet(context);
                    },
                    child: const Text(
                      "Change Profile",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                _auth.currentUser?.email ?? "Guest",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Form(
                  key: globalKey,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        textformfieldwidgets(
                            controller: usernameController,
                            icon: Icons.person,
                            text: "Username"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            labelText: 'Date (YYYY-MM-DD)',
                            hintText: 'Enter the date',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        textformfieldwidgets(
                            controller: phoneNumberController,
                            icon: Icons.phone,
                            text: "Phonenumber"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        textformfieldwidgets(
                            controller: currentAddressController,
                            icon: Icons.location_on,
                            text: "Current address"),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        textformfieldwidgets(
                            controller: EducationsController,
                            icon: Icons.star,
                            text: "Education"),
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
                                    'address': currentAddressController.text,
                                    'date': dateController.text,
                                    'education': EducationsController.text,
                                    'name': usernameController.text,
                                    'phone': phoneNumberController.text,
                                  });
                                } else {
                                  // If the document doesn't exist, create a new one
                                  await db.collection('user').add({
                                    'address': currentAddressController.text,
                                    'date': dateController.text,
                                    'education': EducationsController.text,
                                    'name': usernameController.text,
                                    'phone': phoneNumberController.text,
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your ${text}';
          } else {
            return null;
          }
        },
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: text,
          hintText: "ENter your ${text}",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
