import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projject/common/widgets/image_picking.dart';
import 'package:projject/controller/auth_controller.dart';
import 'package:projject/provider/profileImageProvider.dart';
import 'package:projject/splashScreen.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  TextEditingController newNameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController ExperienceController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView(
        children: [
          Material(
            shadowColor: Colors.black,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            elevation: 10,
            child: Container(
              width: double.infinity,
              height: size.height * 0.37,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 15, 121, 207),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {

                        UserLogout.askLOgout(context);
                      },
                      icon: const Icon(Icons.logout_outlined),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // color: Colors.red,
                        // width: size.width*0.12,
                        // height: 120,
                        child: GestureDetector(
                          onTap: () {
                            ImagePickProfile.BottomSheet(context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Consumer<ProfileImageProvider>(
                              builder: (context, value, child) {
                                return value.filePath == null
                                    ? const CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Colors.red,
                                      )
                                    : CircleAvatar(
                                        radius: 70,
                                        backgroundImage: FileImage(
                                          File(value.filePath!.path),
                                        ),
                                      );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bibash Karki",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            AuthController.auth.currentUser!.email ?? "Guest",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 232, 224, 224),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          const mainTopic(title: "Personal Details"),
          Container(
              width: 1,
              child: const Divider(
                thickness: 1,
                color: Colors.red,
              )),
          listData(topic: "Name", value: "Bibash", ontap: () {}),
          listData(topic: "phone", value: "+9876596785", ontap: () {}),
          listData(topic: "date", value: "2001/2/17", ontap: () {}),
          listData(topic: "address", value: "Kamalamai,Sindhuli", ontap: () {}),
          listData(topic: "email", value:  AuthController.auth.currentUser!.email ?? "Guest", ontap: () {}),
          listData(
              topic: "education",
              value: "Graduated from Cambridge University",
              ontap: () {}),
          SizedBox(
            height: size.height * 0.04,
          ),
          const mainTopic(title: "Work Details"),
          const SizedBox(
              width: 1,
              child: Divider(
                thickness: 1,
                color: Colors.red,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "Experience",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "In my role as a Space Tourism Activity Coordinator at Celestial Voyages, my responsibilities melded the roles of a QA specialist and a front-end developer in a cosmic setting. Acting as a QA specialist, I ensured the seamless operation of all space tourism activities, meticulously testing and refining our cosmic tour routes and safety protocols. As a front-end developer, I collaborated with experts to create user-friendly pre-flight briefings and an interactive portal for travelers to customize their celestial experiences. The fusion of these roles allowed me to innovate in ensuring not only the safety but also the user experience in the uncharted territory of space tourism.",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "Experience",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "At Celestial Voyages, I embarked on a unique role that intertwined the responsibilities of a QA specialist and a front-end developer in the realm of space tourism. As a QA specialist, I meticulously tested and refined our cosmic tour routes, ensuring their flawless operation and the safety of our travelers. This involved conducting comprehensive tests on safety protocols, adapting to varying gravitational conditions, and managing the unexpected challenges of space travel. Concurrently, in my capacity as a front-end developer, I collaborated with a multidisciplinary team to craft an interactive portal. This platform allowed travelers to customize their celestial experiences, providing them with a user-friendly interface for pre-flight briefings and personalized tour options. This fusion of QA expertise and front-end development not only enhanced the safety measures but also revolutionized the user experience, creating an innovative and seamless journey through the uncharted territories of space tourism.",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "Skills",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "In my hybrid role at Celestial Voyages, merging QA specialization and front-end development within the domain of space tourism, I honed a diverse skill set. As a QA specialist, I developed acute attention to detail, meticulously testing and refining cosmic tour routes and safety protocols. This role demanded adaptability in the face of unpredictable cosmic challenges, refining my crisis management abilities and fostering a proactive approach to ensuring traveler safety.Simultaneously, as a front-end developer, I cultivated proficiency in coding languages and UI/UX design, crafting an interactive portal for travelers. This required not only technical expertise but also an understanding of user behavior and preferences in an entirely novel context. Bridging these skill sets demanded a unique blend of creativity and precision, enabling me to create user-friendly interfaces for pre-flight briefings and customizable tour options.This dual skill development not only reinforced my technical abilities but also enriched my adaptability and problem-solving skills in an unparalleled environment, fostering an innovative and seamless user experience within the uncharted realm of space tourism",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "Working peroid",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "In this dual role at Celestial Voyages, I contributed to the cosmic adventures for a fulfilling period of 2 years. This time span allowed for comprehensive skill development and experience in managing the intricacies of space tourism. It encompassed the planning, testing, and implementation phases, affording me the opportunity to contribute significantly to the evolution of interstellar travel within this unique role.",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          const mainTopic(title: "Other"),
          const SizedBox(
              width: 1,
              child: Divider(
                thickness: 1,
                color: Colors.red,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "About Me",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Beyond my professional pursuits, I find deep fulfillment in the mysteries of the cosmos. I'm an avid stargazer, finding solace in the twinkling vastness of the night sky. The notion of interstellar travel and the potential for encountering diverse civilizations beyond Earth captivates my imagination. I often indulge in speculative and scientific literature exploring these themes, fostering a boundless curiosity for the unknown. Whether it's discussing the latest breakthroughs in astrophysics or contemplating the possibility of life beyond our planet, my enthusiasm for space exploration knows no bounds. In my leisure time, I immerse myself in the wonders of the universe, seeking to broaden my understanding of the cosmos and our place within it.Feel free to adjust or add specifics that resonate more personally with your interests and experiences!",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Title(
                color: Colors.black,
                child: const Text(
                  "hobbies",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Beneath the professional realm lies a tapestry of hobbies that fuel my fascination with the cosmos. Stargazing is more than a pastime—it's a passion. Nights find me mesmerized beneath the vast expanse, exploring the mysteries of distant stars and galaxies while capturing their ethereal beauty through astrophotography. In my leisure, I'm immersed in speculative and scientific literature that delves into the possibilities of interstellar travel and the potential existence of extraterrestrial life. This curiosity extends beyond personal exploration; I volunteer at local astronomy clubs and events, sharing my knowledge and enthusiasm for the cosmos with others. Building and launching model rockets has become a hands-on endeavor, allowing me to grasp the fundamentals of propulsion and dynamics crucial in space travel. And in a nod to technology's role in our fascination with space, I often find myself engrossed in space-themed video games, where interactive learning about the universe becomes not just a hobby but a playful yet educational journey.",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
        ],
      ),
    );
  }
  
  //   void editPost(DocumentSnapshot document) {
  //   newNameController.text = document['name'];
  //   aboutController.text=document['about'];

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Edit Post'),
  //         content: TextFormField(
  //           controller: newNameController,
  //           decoration: InputDecoration(border: OutlineInputBorder()),
  //           maxLength: 4,
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Save'),
  //             onPressed: () {
  //               db.collection('user').doc(document.id).update({'name': newNameController.text});
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
class UserLogout{
  static askLOgout(BuildContext context){
    showDialog(context: context,
     builder: (context) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: AlertDialog(
          title: const Text("You sure you wanna logout?",
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context); //close the dialog box
            },
             child: const Text("Nah!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black))),
             TextButton(onPressed: ()async{
              Navigator.push(context,MaterialPageRoute(builder: (context) => const SplashScreen(),));
      
             },
              child: const Text("yeah!",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),)),
              const SizedBox(height: 5,),
          ],
        ),
      );
     },);
  }
}

class listData extends StatelessWidget {
  const listData({
    super.key,
    required this.topic,
    required this.value,
    required this.ontap,
  });
  final String topic;
  final String value;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          leading: Text(
            "$topic :",
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          title: Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class mainTopic extends StatelessWidget {
  const mainTopic({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Title(
          color: Colors.black,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
          )),
    );
  }
}
