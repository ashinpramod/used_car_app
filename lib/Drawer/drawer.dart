import 'package:flutter/material.dart';
import 'package:used_car_app/Drawer/Contact_us.dart';
import 'package:used_car_app/Drawer/profilePage.dart';

// void main(){
//   runApp(MaterialApp(home: DrawerMain()));
// }

class DrawerMain extends StatelessWidget {
  const DrawerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(),drawer: Drawer(
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
          )],

      ),
    ),

    );
  }
}
