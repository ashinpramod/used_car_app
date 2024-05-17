import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MenuPage()));
}

class MenuPage extends StatelessWidget {
  var images = [
    "assets/images/car-charger-with-lightning-cable-20-watt-2-1-amp-per-port-28501791998027_1024x.webp",
    "assets/images/Black-Sliver-Color-16-Inch-Hubcap-Wheel-Cover-Replacement-Car-Vehicle-Wheel-Rim-Skin-Cover-Styling (1).webp",
    "assets/images/car_mirror_zmemw_1200.jpg",
    "assets/images/car-gear-shift-knob-black-stitched-leather-5-speed-manual.jpg",
    "assets/images/cartyreimages.jpg",
    "assets/images/Universal-Luxury-Car-Smart-Lock-LCD-Key-One-Click-Remote-Control-Suitable-for-Land-Rover-BMW-Audi-Ferrari-Lamborghini-Maserati-Car-Accessories.webp",
    "assets/images/steeringistockphoto-157278781-612x612.jpg",
    "assets/images/vaccum_cleaner.jpg",
    "assets/images/carcover51kSyKw0tyL._AC_UF894,1000_QL80_.jpg",
    "assets/images/car-perfume-pack-of-40-gram--063.jpg",
  ];
  var name = [
    "Car Charger",
    "Car Wheel Cup",
    "Blind view Mirror",
    "Gear Knob",
    "car tyre",
    "Car KeyChain",
    "Steering Wheel",
    "vaccum cleaner",
    "body cover",
    "air freshner"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(children: [
        Text(
          "Accessories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 750,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 250),
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              child: Column(children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(images[index]), fit: BoxFit.cover),
                    color: Colors.black,
                  ),
                  height: 200,
                ),
                Text(name[index]),
                Text("Rs.1500"),
              ]),
            ),
          ),
        )
      ])),
    );
  }
}
