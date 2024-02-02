import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:used_car_app/Drawer/Contact_us.dart';
import 'package:used_car_app/Drawer/profilePage.dart';

// void main() {
//   runApp(MaterialApp(home: Navigation_Home()));
// }

class Navigation_Home extends StatefulWidget {
  @override
  State<Navigation_Home> createState() => _Navigation_HomeState();
}

class _Navigation_HomeState extends State<Navigation_Home> {
  var images = [
    "assets/images/Picsart_24-01-20_18-28-15-915.jpg",
    "assets/images/Picsart_24-01-20_19-07-28-100.jpg",
    "assets/images/royaldrivellp-20-01-2024-0039.jpg"
  ];
  var cars = [
    "assets/images/Picsart_24-01-20_18-38-22-960.jpg",
    "assets/images/Picsart_24-01-20_19-06-04-969.jpg",
    "assets/images/Picsart_24-01-20_18-28-15-915.jpg",
    "assets/images/Picsart_24-01-20_18-54-47-673.jpg",
    "assets/images/Picsart_24-01-20_18-50-00-290.jpg",
    "assets/images/Picsart_24-01-21_18-04-10-624.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(accountName: Text("."), accountEmail: Text(".")
                ,decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/green-ford-mustang-shelby-gt500.jpg"),fit: BoxFit.cover)
                ),
              ),
              ListTile(title: Text("Profile"),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },

              ),
              ListTile(title:Text("Contactct Us"),selectedColor: Colors.red,onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact_us()));
              },
              ),
            ListTile(title: Text("Logout"),)],

          ),
        ),
        body: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Welcome!!",style:GoogleFonts.poppins(fontSize: 25,color: Colors.black,fontWeight:FontWeight.bold )),
              //Text("And Deals!",style:GoogleFonts.poppins(fontSize: 25,color: Colors.black,fontWeight:FontWeight.bold ),),
                  SizedBox(height:20),
      CarouselSlider(
          items: List.generate(
              3,
              (index) => Container(
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
      Text(
        "New Arrivals!!",
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white),
          height: 500,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage(cars[index]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              // child: Column(
              //   children: [
              //     Text(
              //       "Bmw m5 320",
              //       style: TextStyle(backgroundColor: Colors.white),
              //     ),
              //   ],
              // )),
            ),
          ),
        )),
      ),
    ])));
  }
}
