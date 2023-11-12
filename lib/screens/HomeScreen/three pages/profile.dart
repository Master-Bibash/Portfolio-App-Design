import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('users').doc(_auth.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData && snapshot.data != null) {
              var userData = snapshot.data!.data() as Map<String, dynamic>;

              String userName = userData['name'] ?? 'User';
              String userEmail = userData['email'] ?? 'No email';
              String userPhoneNumber = userData['phone'] ?? 'No phone number';
              String userAddress = userData['address'] ?? 'No address';

              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF345FB4),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(69),
                        bottomLeft: Radius.circular(69),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 50,
                            backgroundColor: Color(0xFF6789CA),
                            backgroundImage: AssetImage('assets/images/person.png'),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                userEmail,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text("Date of birth"), // You can add actual data here
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "Phone Number: $userPhoneNumber",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Address: $userAddress",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Add more ListTile widgets for other user data...
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text("No data available"));
            }
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
