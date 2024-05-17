import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  runApp(MaterialApp(home: AddItem()));
}

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerOwners = TextEditingController();
  final TextEditingController _controllerTransmissionType = TextEditingController();
  final TextEditingController _controllerFuelType = TextEditingController();
  final TextEditingController _controllerKmsDriven = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final CollectionReference _carCollection =
  FirebaseFirestore.instance.collection('ListofCars');

  List<String> _imageUrls = [];

  Future<void> _pickImages() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile>? files = await imagePicker.pickMultiImage();

    if (files == null || files.isEmpty) return;

    try {
      for (XFile file in files) {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('images');
        Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putFile(File(file.path));
        String downloadUrl = await referenceImageToUpload.getDownloadURL();
        _imageUrls.add(downloadUrl);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Images uploaded successfully')));
    } catch (error) {
      print('Error uploading images: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading images')));
    }
  }

  Future<void> _uploadData() async {
    if (_imageUrls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please upload at least one image')));
      return;
    }

    if (_formKey.currentState!.validate()) {
      String itemName = _controllerName.text;
      String itemPrice = _controllerPrice.text;
      String transmissionType = _controllerTransmissionType.text;
      String fuelType = _controllerFuelType.text;
      String owners = _controllerOwners.text;
      String kmsDriven = _controllerKmsDriven.text;

      Map<String, dynamic> dataToSend = {
        'name': itemName,
        'price': itemPrice,
        'transmission': transmissionType,
        'fuel': fuelType,
        'owners': owners,
        'kmsDriven': kmsDriven,
        'images': _imageUrls,
      };

      try {
        await _carCollection.add(dataToSend);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data uploaded successfully')));
      } catch (error) {
        print('Error uploading data: $error');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading data')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(hintText: 'Enter the name of the Car'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the car name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerPrice,
                decoration: InputDecoration(hintText: 'Enter the price of the Car'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the car price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerTransmissionType,
                decoration: InputDecoration(hintText: 'Enter the transmission type'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the transmission type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerFuelType,
                decoration: InputDecoration(hintText: 'Enter the fuel type'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the fuel type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerKmsDriven,
                decoration: InputDecoration(hintText: 'Enter the kilometers driven'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the kilometers driven';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerOwners,
                decoration: InputDecoration(hintText: 'Enter the number of owners'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of owners';
                  }
                  return null;
                },
              ),
              IconButton(
                onPressed: _pickImages,
                icon: Icon(Icons.camera_alt),
                tooltip: 'Pick Images',
              ),
              ElevatedButton(
                onPressed: _uploadData,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
