import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projject/common/reusablealert.dart';
import 'package:projject/controller/auth_controller.dart';
import 'package:projject/screens/HomeScreen/loginscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
              height: size.height * 0.40,
              width: size.width * 0.10,
              child: Lottie.asset(
                "assets/animations/green.json",
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Introduce ourself,",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Make a pretty good profile as you like,",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Form(
              key: globalKey,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill the password";
                        }
                        return null;
                      },
                      controller: passController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off),
                        ),
                        prefixIcon: const Icon(Icons.fingerprint_outlined),
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                "Already a member?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.07,
              width: size.width,
              margin: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    AuthController.createUser(
                      emailController.text.trim(),
                      passController.text,
                      context,
                    );
                  } else {
                    reusableSnackbar.showSnackBar(context, "Please try again");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
