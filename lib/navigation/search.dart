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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [ SafeArea(
          child: Column(children: [SizedBox(height: 20,),
            Container(
              width: 400,
              height: 30,
              decoration: BoxDecoration(
                  // boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    onTap: () {
                      showSearch(context: context, delegate: SearchItem());
                    },
                    expands: true, maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      labelText: "Search here",
                      suffixStyle: TextStyle(fontSize: 30),
                    ),
                    // cursorHeight: 20,
                    // cursorColor: Colors.blue,
                    // cursorRadius: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ]),
        ),
        ],),
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
                  return GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(myList.length)));}
                    ,child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: 140,
                                child: Image.network(
                                  data['imageUrl'] ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SizedBox(height: 15,),
                                  Text(
                                    data['name'] ?? "no name",
                                    style: TextStyle(
                                        fontSize: 19, fontWeight: FontWeight.bold),
                                  ),SizedBox(height: 5,)
                                  ,                        Text(data['price'] ?? 'No Price'),
                                  // Text(data['owners'] ?? 'No owners'),
                                  Text(data['transmission'] ?? 'No transmission'),
                                  Text(data['fuel'] ?? 'no fuel'),
                                  // Text(data['kmsDriven'] ?? 'No kms'),
                                ],
                              )
                            ])),
                  );
                }).toList()
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance.collection('Cars_list')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return const Text('Something went wrong');
        //     }
        //
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     }
        //
        //     return ListView(
              // children: snapshot.data!.docs.map((document) {
              //   Map<String, dynamic> data =
              //   document.data()! as Map<String, dynamic>;
              //   return Card(
              //       child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               height: 150,
              //               width: 130,
              //               child: Image.network(
              //                 data['imageUrl'] ?? '',
              //                 fit: BoxFit.fill,
              //               ),
              //             ),
              //             SizedBox(
              //               width: 50,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   data['name'] ?? "no name",
              //                   style: TextStyle(
              //                       fontSize: 18, fontWeight: FontWeight.bold),
              //                 ),
              //                 Text(data['price'] ?? 'No Price'),
              //                 Text(data['owners'] ?? 'No owners'),
              //                 Text(data['transmission'] ?? 'No transmission'),
              //                 Text(data['fuel'] ?? 'no fuel'),
              //                 Text(data['kmsDriven'] ?? 'No kms'),
              //               ],
              //             )
              //           ]));
              // }).toList(),
            );
          },
        ),
      ),
    );
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
      itemBuilder: (context, index) =>
          ListTile(
            onTap: () {
              close(context, suggestionsList[index]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(myList
                              .indexWhere((item) =>
                          item == suggestionsList[index]))));
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
