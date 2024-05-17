import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:used_car_app/car_login.dart';

import 'firebase/fire_function.dart';

// void main() {
//   runApp(MaterialApp(home: Car_resistration()));
// }

class Car_resistration extends StatefulWidget {
  @override
  State<Car_resistration> createState() => _Car_resistrationState();
}

class _Car_resistrationState extends State<Car_resistration> {
  var email_ctrl =TextEditingController();
  var pass_ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: [
          Text(
            "Create an account",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    suffixStyle: GoogleFonts.poppins(color: Colors.grey),
                    icon: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Icon(Icons.person),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: TextField(
                  controller: email_ctrl,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      suffixStyle: GoogleFonts.poppins(color: Colors.grey),
                      icon: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Icon(Icons.email),
                      )),
                )),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: TextField(
                  controller: pass_ctrl,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixStyle: GoogleFonts.poppins(color: Colors.grey),
                      icon: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Icon(Icons.password),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp)),
                )),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm Password",
                      suffixStyle: GoogleFonts.poppins(color: Colors.grey),
                      icon: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Icon(Icons.password_outlined),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_sharp))),
            ),
          ),
          SizedBox(height: 40),

          ElevatedButton(onPressed: () {
    String email = email_ctrl.text.trim();
    String pass = pass_ctrl.text.trim();
    FireBaseHelper().registerUser(email: email, pwd: pass).then((result) {
    if (result == null) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CarLogin()));
    } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(result)));
    }
    });
    },
              style: ButtonStyle(
                shadowColor: MaterialStatePropertyAll(Colors.black),
                elevation: MaterialStatePropertyAll(15),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
              ),

              child: Text(
                "SignUp",
                style: GoogleFonts.poppins(color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
