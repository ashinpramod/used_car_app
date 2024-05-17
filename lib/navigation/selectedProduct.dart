import 'package:flutter/material.dart';

class Selected_Product extends StatelessWidget {
  const Selected_Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Image.asset("assets/images/car-charger-with-lightning-cable-20-watt-2-1-amp-per-port-28501791998027_1024x.webp"),
          Text("Dual Port Car charger",style: TextStyle(fontSize: 20),),
          Text("Price : RS.100",style: TextStyle(fontSize: 20),),
          SizedBox(height: 50),
          MaterialButton(onPressed: (){},color: Colors.orange,
          child: Text("Buy Now" ),)],

        ),
      ),
    );
  }
}
