import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:used_car_app/navigation/SelectedCar.dart';

// void main() {
//   runApp(MaterialApp(home: SearchPage()));
// }

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search here",
                      suffixStyle: TextStyle(),
                    ),
                    cursorHeight: 35,
                    cursorColor: Colors.blue,
                    cursorRadius: Radius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270.0),
              child: Text("Available cars!",style:GoogleFonts.poppins(fontSize: 17,color: Colors.black,fontWeight:FontWeight.bold )),
            ),
            SingleChildScrollView(
              child: Container(
                  height: 750,
                  decoration: BoxDecoration(color: Colors.white),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: 10,
                    itemBuilder: (contect, index) => GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectedCar()));
                    },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Picsart_24-01-20_18-28-15-915.jpg"),
                                  fit: BoxFit.cover),
                              color: Colors.black,
                            ),
                            height: 150,
                          ),
                          Text(
                            "Audi Q7",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          Text("price:Rs.2500000",style:TextStyle(color: Colors.black,fontSize: 15),
                          ),]),
                      ),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
