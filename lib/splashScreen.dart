import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projject/screens/HomeScreen/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 26, 26),
      body: ListView(
        children: [
          Center(
            child: Container(
              height: size.height * 0.7,
              width: double.infinity,
              child: Lottie.asset("assets/animations/splash.json"),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                
                "Make an unique bio for yourself\nand show the world who you are",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.w600,
                color:Color.fromARGB(255, 233, 224, 224) ,
                 fontSize: 20),
              )),
              SizedBox(
            height: size.height*0.04,
            
          ),
          Container(
            height: size.height*0.10,
            width: size.width,
            margin: const EdgeInsets.only(left: 30,right: 30,bottom: 10),
            child: ElevatedButton(onPressed: (){

              Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
             child: const Text("Let's get started",
             textAlign: TextAlign.center,
             style: TextStyle(color: Colors.black87,fontSize: 16),)),
          ),
          SizedBox(
          
            height: size.height*0.03,)
        ],
      ),
    );
  }
}
