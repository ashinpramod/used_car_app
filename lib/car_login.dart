import 'package:flutter/material.dart';
import 'package:used_car_app/car_bottombar_home.dart';
import 'package:used_car_app/car_registrationPage.dart';
import 'package:used_car_app/main.dart';
import 'package:used_car_app/navigation/navigation_home.dart';

import 'firebase/fire_function.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CarLogin()));
}

class CarLogin extends StatefulWidget {
  @override
  State<CarLogin> createState() => _CarLoginState();
}

class _CarLoginState extends State<CarLogin> {
  var email_ctrl = TextEditingController();
  var pass_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/Land-Rover-land-rover-defender-car-vehicle-offroad-minimalism-2157857-wallhere.com.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(40, 40),
                          bottomRight: Radius.elliptical(40, 40))),
                  height: 250,
                ),
                Container(
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade300))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: email_ctrl,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(Icons.email),
                                        iconColor: Colors.black,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: pass_ctrl,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.password),
                                        iconColor: Colors.black,
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password?"),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                            onPressed: () {
                              String email = email_ctrl.text.trim();
                              String pass = pass_ctrl.text.trim();
                              FireBaseHelper()
                                  .loginUser(email: email, pwd: pass)
                                  .then((result) {
                                if (result == null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cars_home()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.blue,
                                          content: Text(result)));
                                }
                              });
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Navigation_Home()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black),
                                shadowColor:
                                    MaterialStatePropertyAll(Colors.black),
                                elevation: MaterialStatePropertyAll(15)),
                            child: Text(
                              "Signin",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(height: 10),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Car_resistration()));
                            },
                            child: Text(
                              "Don't have an account? Create one here!",
                              style: TextStyle(fontSize: 15),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
