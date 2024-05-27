import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/navigation/payment.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCdyC6rALvPw8DfCVV1LNW2roEsm-a3do8",
      appId: "1:477348733897:android:d81c61c1be06246329be18",
      messagingSenderId: "",
      projectId: "project-car-app",
      storageBucket: "project-car-app.appspot.com",
    ),
  );
  runApp(MaterialApp(home: SearchPage()));
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [ SafeArea(
          child: Column(children: [
              Container(
                width: 400,
                height: 50,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
              ),]),
        )],),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Cars_list').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                return Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 130,
                            child: Image.network(
                              data['imageUrl'] ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['name'] ?? "no name",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(data['price'] ?? 'No Price'),
                              Text(data['owners'] ?? 'No owners'),
                              Text(data['transmission'] ?? 'No transmission'),
                              Text(data['fuel'] ?? 'no fuel'),
                              Text(data['kmsDriven'] ?? 'No kms'),
                            ],
                          )
                        ]));
              }).toList(),
            );
          },
        ),
    // StreamBuilder<QuerySnapshot>(
  //       stream: FirebaseFirestore.instance.collection('Cars_list').snapshots(),
  //   builder: (context, snapshot) {
  //   if (snapshot.hasError) {
  //   return const Text('Something went wrong');
  //   }
  //
  //   if (snapshot.connectionState == ConnectionState.waiting) {
  //   return const CircularProgressIndicator();
  //   }
  //
  //   return ListView(
  //   children: snapshot.data!.docs.map((document) {
  //   Map<String, dynamic> data =
  //   document.data()! as Map<String, dynamic>;
  //   return
  //       Column(children: [
  //           SizedBox(height: 20),
  //           Container(
  //             width: 400,
  //             height: 50,
  //             decoration: BoxDecoration(
  //                 boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(50)),
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 8.0),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: TextField(
  //                   onTap: () {
  //                     showSearch(context: context, delegate: SearchItem());
  //                   },
  //                   decoration: InputDecoration(
  //                     border: InputBorder.none,
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     prefixIcon: Padding(
  //                       padding: const EdgeInsets.only(bottom: 30),
  //                       child: Icon(
  //                         Icons.search,
  //                         color: Colors.grey,
  //                       ),
  //                     ),
  //                     hintText: "Tap to Search",
  //                     suffixStyle: TextStyle(),
  //                   ),
  //                   // cursorHeight: 20,
  //                   // cursorColor: Colors.blue,
  //                   // cursorRadius: Radius.circular(100),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(right: 260.0),
  //             child: Text("Available cars!",
  //                 style: GoogleFonts.poppins(
  //                     fontSize: 17,
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold)),
  //           ),
  //           SizedBox(height: 10),
  //           SingleChildScrollView(
  //             child: Container(
  //                 height: 750,
  //                 decoration: BoxDecoration(color: Colors.white),
  //                 child: GridView.builder(
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                       crossAxisCount: 2,
  //                       childAspectRatio: 1,
  //                       mainAxisSpacing: 10,
  //                       crossAxisSpacing: 10),
  //                   itemCount: 5,
  //                   itemBuilder: (contect, index) => GestureDetector(
  //                     onTap: () {
  //                       Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => SelectedCar()));
  //                     },
  //                     child: Container(
  //                       height: 300,
  //                       decoration: BoxDecoration(color: Colors.grey.shade300),
  //                       child: Column(children: [
  //                         Container(
  //                           alignment: Alignment.bottomCenter,
  //                           decoration: BoxDecoration(
  //                             image: DecorationImage(
  //                                 image: NetworkImage(data['imageUrl']??'no image'),
  //                                 fit: BoxFit.cover),
  //                             color: Colors.black,
  //                           ),
  //                           height: 150,
  //                         ),
  //                         Text(data['name'] ?? 'no name',
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 20),
  //                         ),
  //                         Text(
  //                           "price:Rs.2500000",
  //                           style: TextStyle(color: Colors.black, fontSize: 15),
  //                         ),
  //                       ]),
  //                     ),
  //                   ),
  //                 )),
  //           ),
  //         ]);}).toList()
  //
  //   );
  // }
  //       )
    );}}

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
