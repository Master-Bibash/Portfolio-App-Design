import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projject/common/widgets/dateselector.dart';
import 'package:projject/provider/changeIndexprovider.dart';
import 'package:projject/provider/profileImageProvider.dart';
import 'package:projject/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCH3dznzZVweTVH2y0Vd0chzUuvNh8Txrc",
          appId: "1:685281580872:android:2e22eabb3964854b42c57d",
          messagingSenderId: "685281580872",
          projectId: "profile-11349",
          ));
  print("firebase initialized");
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => changeIndex(),
        ),
        ChangeNotifierProvider(create: (context) => ProfileImageProvider(),),
        ChangeNotifierProvider(create: (context) => DateSelectorProvider(),),
      ],
      child: MaterialApp(
          title: "Profile App",
          theme: ThemeData(primarySwatch: Colors.lightGreen),
          debugShowCheckedModeBanner: false,
          home:  SplashScreen()),
    );
  }
}

