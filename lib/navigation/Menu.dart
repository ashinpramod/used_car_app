import 'package:flutter/material.dart';
import 'package:used_car_app/navigation/selectedProduct.dart';

// void main() {
//   runApp(MaterialApp(home: MenuPage()));
// }

class MenuPage extends StatelessWidget {
  var images = [
    "assets/images/belkin-car-accessories-belkin-dual-car-charger-with-lightning-cable-20-watt-2-1-amp-per-port-28501791998027_1024x.webp",
    "assets/images/Black-Sliver-Color-16-Inch-Hubcap-Wheel-Cover-Replacement-Car-Vehicle-Wheel-Rim-Skin-Cover-Styling (1).webp",
    "assets/images/istockphoto-1297422689-612x612.jpg",
    "assets/images/pngtree-car-radio-electronics-switch-car-accessory-photo-image_1072681.jpg",
    "assets/images/cartyreimages.jpg",
    "assets/images/Universal-Luxury-Car-Smart-Lock-LCD-Key-One-Click-Remote-Control-Suitable-for-Land-Rover-BMW-Audi-Ferrari-Lamborghini-Maserati-Car-Accessories.webp",
    "assets/images/steeringistockphoto-157278781-612x612.jpg",
    "headlightistockphoto-183418280-612x612.jpg",
    "assets/images/carcover51kSyKw0tyL._AC_UF894,1000_QL80_.jpg",
    "assets/images/eco-friendly-long-lasting-fresh-fragrance-liquid-car-perfume-pack-of-40-gram--063.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [Text("Accessories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          Container(
              decoration: BoxDecoration(color: Colors.white),
              height: 750,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Selected_Product()));
                  },
                    child: Container(
                        height: 300,
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover),
                              color: Colors.black,
                            ),
                            height: 200,
                            child: Container(color: Colors.grey.shade300,height: 50,width: 200,
                            child: Text("Price : Rs.100",style: TextStyle(fontSize: 20),),),
                          )
                        ])),
                  )))
        ])));
  }
}
