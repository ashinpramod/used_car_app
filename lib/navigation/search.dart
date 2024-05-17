import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:used_car_app/navigation/SelectedCar.dart';
import 'package:used_car_app/navigation/payment.dart';


void main() {
  runApp(MaterialApp(home: SearchPage()));
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
                    onTap: () {
                      showSearch(context: context, delegate: SearchItem());
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Tap to Search",
                      suffixStyle: TextStyle(),
                    ),
                    // cursorHeight: 20,
                    // cursorColor: Colors.blue,
                    // cursorRadius: Radius.circular(100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260.0),
              child: Text("Available cars!",
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
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
                    itemBuilder: (contect, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedCar()));
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
                                      "assets/images/audiq7_front.jpg"),
                                  fit: BoxFit.cover),
                              color: Colors.black,
                            ),
                            height: 150,
                          ),
                          Text(
                            "Audi Q7",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "price:Rs.2500000",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ]),
                      ),
                    ),
                  )),
            ),
          ]),
        ));
  }
}

final List<String> myList = [
  "Audi Q7",
  "Bmw X1",
  "HMC Fiat 500",
  "Mercedes Benz C220D",
  "MiniCooper",
  "Volvo XC 90"
];
var images = [
  "assets/images/audiq7_front.jpg",
  "assets/images/bmw_x1_front.jpg",
  "assets/images/hmc_fiat_500_front.jpg",
  "assets/images/benz_c220d_front.jpg",
  "assets/images/minicooper_front.jpg",
  "assets/images/volvo_xc_90_front.jpg"
];

class SearchItem extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SearchPage()));
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionsList = query.isEmpty
        ? myList
        : myList
            .where((p) => p.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, suggestionsList[index]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(myList
                      .indexWhere((item) => item == suggestionsList[index]))));
        },
        title: Text(suggestionsList[index]),
      ),
      itemCount: suggestionsList.length,
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${myList[index]}"),
        ),
        body: Column(
          children: [
            Container(
              width: 500,
              color: Colors.red,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(images[index]), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Model : ${myList[index]}",
              style: TextStyle(fontSize: 20),
            ),
            Text("Type : Petrol",
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            Text("Kilometers : 60000 K.M", style: TextStyle(fontSize: 20)),
            Text("Price : R.S.2500000", style: TextStyle(fontSize: 20)),
            Text("Owners : 2 ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
              },
              child: Text("Book Now"),
              minWidth: 300,
              color: Colors.orange,
            )
          ],
        ));
  }
}
