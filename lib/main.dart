import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:used_car_app/car_login.dart';
import 'package:used_car_app/controller/bottom_nav_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCdyC6rALvPw8DfCVV1LNW2roEsm-a3do8",
          appId: "1:477348733897:android:d81c61c1be06246329be18",
          messagingSenderId: "",
          projectId: "project-car-app",
          storageBucket: "project-car-app.appspot.com"));
  // Firebase.initializeApp();

  runApp(CarApp()
      // MaterialApp(
      //   home: user==null ? CarLogin() : Cars_home())
      );
}

class CarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNavController())
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: CarLogin()));
  }
}
