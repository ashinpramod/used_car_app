import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  runApp(MaterialApp(home: AddItem()));
}

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerOwners = TextEditingController();
  TextEditingController _controllerTransmissionType = TextEditingController();
  TextEditingController _controllerFuelType = TextEditingController();
  TextEditingController _controllerkmsDriven = TextEditingController();


  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
  FirebaseFirestore.instance.collection('Cars_list');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration:
                InputDecoration(hintText: 'Enter the name of the Car'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerPrice,
                decoration:
                InputDecoration(hintText: 'Enter the price of the Car'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item Price';
                  }

                  return null;
                },
              ),

              TextFormField(
                controller: _controllerTransmissionType,
                decoration:
                InputDecoration(hintText: 'Enter the transmission type'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Transmission Type';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerFuelType,
                decoration:
                InputDecoration(hintText: 'Enter the fuel type'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Fuel Type';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerkmsDriven,
                decoration:
                InputDecoration(hintText: 'Enter the kilometer'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the kilometer';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerOwners,
                decoration:
                InputDecoration(hintText: 'Enter the number of owners'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of owners';
                  }

                  return null;
                },
              ),

              IconButton(
                  onPressed: () async {
                    /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                    /*Step 1:Pick image*/
                    //Install image_picker
                    //Import the corresponding library

                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                    referenceRoot.child('image');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                    referenceDirImages.child('name');

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file.path));
                      //Success: get the download URL
                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }
                  },
                  icon: Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Please upload an image')));

                      return;
                    }

                    if (key.currentState!.validate()) {
                      String itemName = _controllerName.text;
                      String itemPrice = _controllerPrice.text;
                      String transmissionType= _controllerTransmissionType.text;
                      String fuelType =_controllerFuelType.text;
                      String owners = _controllerOwners.text;
                      String kilometer = _controllerkmsDriven.text;


                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'name': itemName,
                        'price': itemPrice,
                        'transmission':transmissionType,
                        'fuel': fuelType,
                        'owner': owners,
                        'kms driven': kilometer,
                        'image': imageUrl,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
