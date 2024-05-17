

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:used_car_app/firebase/edit_item.dart';
// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: FirebaseOptions(
//           apiKey:"AIzaSyCdyC6rALvPw8DfCVV1LNW2roEsm-a3do8",
//           appId: "1:477348733897:android:d81c61c1be06246329be18",
//           messagingSenderId: "",
//           projectId:"project-car-app",
//           storageBucket:"project-car-app.appspot.com")
//   );
//
//   runApp(MaterialApp(home: ItemDetails("")));
// }
class ItemDetails extends StatelessWidget {
   ItemDetails(this.itemId,{Key?key}):super(key:key){
     var reference = FirebaseFirestore.instance.collection('cars_list').doc(itemId);
      var futureData =reference.get();

   }
   String itemId;
   late DocumentReference reference;
   late Future<DocumentSnapshot>futureData;
   late Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
        actions: [
          IconButton(onPressed: (){
            //add the id to the map
            data['id']= itemId;
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditItem(data)));
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){
            //Delete the item
            reference.delete();
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: futureData,
        builder: (BuildContext context,AsyncSnapshot snapshot ) {
          if(snapshot.hasError){
            return Center(child: Text("Some error has occured ${snapshot.error}"));
          }

          if(snapshot.hasData){
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Column(
              children: [Text('${data['name']}'),
              Text('${data['price']}'),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        }

      ),
    );
  }
}
