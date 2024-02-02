import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home: Contact_us()
//
//   ));
// }

class Contact_us extends StatelessWidget {
  const Contact_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(
                color: Colors.black,blurStyle: BlurStyle.outer,blurRadius: 10
              )],
                color: Colors.grey.shade300,
              ),
              height: 600,
              width: 350,
            child: Column(
              children: [SizedBox(height: 100),
                Text("For more Enquires",style: TextStyle(fontSize: 20),),
                Text("Contact Us",style: TextStyle(fontSize: 20)),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone,size: 30,),
                    Text("9061801150",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),)

          ],
        ),
      ),
    );
  }
}
