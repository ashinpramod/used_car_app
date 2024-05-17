import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/firebase/img_details_store.dart';
import 'package:used_car_app/firebase/item_details.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey:"AIzaSyCdyC6rALvPw8DfCVV1LNW2roEsm-a3do8",
          appId: "1:477348733897:android:d81c61c1be06246329be18",
          messagingSenderId: "",
          projectId:"project-car-app",
          storageBucket:"project-car-app.appspot.com")
  );

  runApp(MaterialApp(home: DataPage()));
}
// class ItemList extends StatelessWidget {
//   ItemList({Key? key}) : super(key: key) {
//     _stream = _reference.snapshots();
//   }
//
//   CollectionReference _reference =
//   FirebaseFirestore.instance.collection('Cars_list');
//
//   //_reference.get()  ---> returns Future<QuerySnapshot>
//   //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
//   late Stream<QuerySnapshot> _stream;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Items'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _stream,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           //Check error
//           if (snapshot.hasError) {
//             return Center(child: Text('Some error occurred ${snapshot.error}'));
//           }
//
//           //Check if data arrived
//           if (snapshot.hasData) {
//             //get the data
//             QuerySnapshot querySnapshot = snapshot.data;
//             List<QueryDocumentSnapshot> documents = querySnapshot.docs;
//
//             //Convert the documents to Maps
//             List<Map> items = documents.map((e) => e.data() as Map).toList();
//
//             //Display the list
//             return ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   //Get the item at this index
//                   Map thisItem = items[index];
//                   //REturn the widget for the list items
//                   return ListTile(
//                     title: Text('${thisItem['name']}'),
//                     subtitle: Text('${thisItem['price']}'),
//                     leading: Container(
//                       height: 80,
//                       width: 80,
//                       child: thisItem.containsKey('image') ? Image.network(
//                           '${thisItem['image']}') :Text("hai"),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ItemDetails(thisItem['id'])));
//                     },
//                   );
//                 });
//           }
//
//           //Show loader
//           return Center(child: CircularProgressIndicator());
//         },
//       ), //Display a list // Add a FutureBuilder
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => AddItem()));
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// class DataPage extends StatelessWidget {
//   final CollectionReference collectionRef =
//   FirebaseFirestore.instance.collection('Cars_list');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore Data'),
//       ),
//       body: StreamBuilder(
//         stream: collectionRef.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Something went wrong'));
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//               return ListTile(
//                 title: Text(data['name'] ?? 'No Title'),
//                 subtitle: Text(data['price'] ?? 'No Description'),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//


class DataPage extends StatelessWidget {
  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection('Cars_list');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Data'),
      ),
      body: StreamBuilder(
        stream: collectionRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

              return Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: data['image'] != null
                      ? Image.network(data['image'])
                      : Placeholder(fallbackHeight: 50, fallbackWidth: 50),
                  title: Text(data['name'] ?? 'No Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Owner: ${data['owner'] ?? 'No Owner'}'),
                      Text('Price: ${data['price'] ?? 'No Price'}'),
                      Text('Fuel: ${data['fuel'] ?? 'No Fuel'}'),
                      Text('Kms Driven: ${data['kms driven'] ?? 'No Kms Driven'}'),
                      Text('Transmission: ${data['transmission'] ?? 'No Transmission'}'),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}