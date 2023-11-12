import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projject/screens/HomeScreen/signupscreen.dart';

import '../../controller/auth_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            height: size.height * 0.40,
            width: double.infinity * 0.10,
            child: Lottie.asset(
              "assets/animations/hello.json",
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back,",
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
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email';
                      
                    }else{
                      return null;
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: "Email",
                    hintText: "ENter your email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please fill the password";
                    }
                    return null;
                  },
                  controller: passController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility_off)),
                    prefixIcon: Icon(Icons.fingerprint_outlined),
                    labelText: "Password",
                    hintText: "ENter your password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          )
          ),
          GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password ?",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontStyle: FontStyle.normal),
              )),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.07,
            width: size.width,
           
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 25),
            child: ElevatedButton(
                onPressed: () {
               if (globalKey.currentState!.validate()) {
              AuthController.loginUser(
                
                emailController.text.trim(),
                 passController.text.trim(),
                  context) ;               
               }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
                
                
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
       GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp(),));
        },
         child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            
            children: [
          TextSpan(text: "Dont Have an Account?",
          style: TextStyle(color: Colors.black,fontSize: 15,
          fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)),
          TextSpan(
            
            text: " Sign-Up",
          style: TextStyle(color: Colors.blue,fontSize: 13,
          fontWeight: FontWeight.w400,fontStyle: FontStyle.normal)),
           
          
          
         ])),
       )
         
        ],
      ),
    ));
  }
}
