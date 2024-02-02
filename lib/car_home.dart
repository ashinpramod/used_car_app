import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/homehome.dart';
import 'package:used_car_app/navigation/Menu.dart';
import 'package:used_car_app/navigation/navigation_home.dart';
import 'package:used_car_app/navigation/search.dart';
// void main(){
//   runApp(MaterialApp(home:Cars_home()));
// }

class Cars_home extends StatefulWidget {



  @override
  State<Cars_home> createState() => _Cars_homeState();
}

class _Cars_homeState extends State<Cars_home> {
  int index=0;
  var screens=[Navigation_Home(),SearchPage(),MenuPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(backgroundColor:Colors.white,shadowColor:Colors.black,activeColor:Colors.grey,elevation:8,items: [
        TabItem(icon: Icon(Icons.home,color: Colors.black,)),
        TabItem(icon: Icon(Icons.search,color: Colors.black,)),
        TabItem(icon: Icon(Icons.menu,color: Colors.black),),
      ],onTap: (tapindex){
        setState(() {
          index = tapindex;
        });
      }),
      body: screens[index]
    );
  }
}
