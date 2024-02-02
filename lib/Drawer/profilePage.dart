import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home: ProfilePage()));
// }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(radius: 100,
              backgroundColor: Colors.cyan,
             backgroundImage: AssetImage("assets/images/Picsart_24-01-20_18-38-22-960.jpg"),

            ),
            SizedBox(height: 50),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),boxShadow:[BoxShadow(
              color: Colors.black,blurRadius: 10
            )],color: Colors.grey.shade300),
              height: 400,
              width: 350,
            child:
              Column(
                children: [SizedBox(height: 100),
                  Text("Name  :    Ashin",style: TextStyle(fontSize: 20)),
                  Text("Email :   ashinpramod@gmail.com",style: TextStyle(fontSize: 20)),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}
