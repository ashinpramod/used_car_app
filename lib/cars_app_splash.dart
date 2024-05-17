import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:used_car_app/car_login.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CarSplash()));
}

class CarSplash extends StatefulWidget {
  @override
  State<CarSplash> createState() => _CarSplashState();
}

class _CarSplashState extends State<CarSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => CarLogin()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        //     children: [Lottie.asset("assets/animations/Animation - 1705599021050.json"),
        //   Text("Welcome to AutoMac")],
        //   ),
        //   ),
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/volkswagonae70618c-f2d6-4c95-bd57-ed098043a44a.jpeg"),
                fit: BoxFit.cover)),
      ),
    ));
  }
}
