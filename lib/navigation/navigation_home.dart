import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:used_car_app/Drawer/Contact_us.dart';
import 'package:used_car_app/Drawer/profilePage.dart';

import '../car_login.dart';
import '../firebase/fire_function.dart';

void main() {
  runApp(MaterialApp(home: Navigation_Home()));
}

class Navigation_Home extends StatefulWidget {
  @override

  State<Navigation_Home> createState() => _Navigation_HomeState();
}

class _Navigation_HomeState extends State<Navigation_Home> {

  var images = [
    "assets/images/audiq7_front.jpg",
    "assets/images/bmw_x1_back.jpg",
    "assets/images/bmw_x1_interior.jpg"
  ];
  var cars = [
    "assets/images/volvo_xc_90_front.jpg",
    "assets/images/bmw_x1_front.jpg",
    "assets/images/audiq7_front.jpg",
    "assets/images/benz_c220d_front.jpg",
    "assets/images/minicooper_front.jpg",
    "assets/images/hmc_fiat_500_front.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
        endDrawer: Drawer(
          child: ListView(
            children: [SizedBox(height: 25),
              UserAccountsDrawerHeader(
                accountName: Text(""), accountEmail: Text("")
                , decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(
                      "assets/images/green-ford-mustang-shelby-gt500.jpg"),
                      fit: BoxFit.cover)
              ),
              ),
              ListTile(title: Text("Profile"), onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },

              ),
              ListTile(title: Text("Contactct Us"),
                selectedColor: Colors.red,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contact_us()));
                },
              ),
              ListTile(title: Text("Logout"),
              onTap:(){
    FireBaseHelper().logout().then((value) =>
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CarLogin())));}
              )],

          ),
        ),
        body: Container(
            child:
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text("Welcome!", style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
              ),
              //Text("And Deals!",style:GoogleFonts.poppins(fontSize: 25,color: Colors.black,fontWeight:FontWeight.bold ),),
              SizedBox(height: 10),
              CarouselSlider(
                  items: List.generate(
                      3,
                          (index) =>
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.cover)),
                          )),
                  options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      autoPlayCurve: Curves.decelerate,
                      pauseAutoPlayOnTouch: true)),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text(
                  "New Arrivals!",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white),
                      height: 800,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: 6,
                        itemBuilder: (context, index) =>
                            Container(child:
                              Column(children: [Container(height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(cars[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.all(Radius
                                      .circular(10))),

                         ),
                                Text("Audi Q7")
                      ],),
                    )),
              ),
                ))])));
  }
}
