import 'package:flutter/material.dart';
import 'package:used_car_app/navigation/payment.dart';

class SelectedCar extends StatelessWidget {
  const SelectedCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
            image: DecorationImage(image: AssetImage("assets/images/Picsart_24-01-20_18-28-15-915.jpg"))
          ),height: 300),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                color: Colors.grey.shade200,
              ),
              height: 300,
              width: 350,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text("AudiQ7",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("Type : Petrol",style: TextStyle(fontSize: 20),textAlign: TextAlign.end),
                  Text("Kilometers : 60000 K.M",style: TextStyle(fontSize: 20)),
                  Text("Price : R.S.2500000",style: TextStyle(fontSize: 20)),
                  Text("Owners : 2 ",style: TextStyle(fontSize: 20)),
                  
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                    
                  },child: Text("Book Now"),
                  minWidth: 300,color: Colors.orange,)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
