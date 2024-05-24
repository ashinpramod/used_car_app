
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
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

  runApp(MaterialApp(home: AddUserScreen()));
}
class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerName = TextEditingController();
  final _controllerPrice = TextEditingController();
  final _controllerOwners = TextEditingController();
  final _controllerTransmissionType = TextEditingController();
  final _controllerFuelType = TextEditingController();
  final _controllerkmsDriven = TextEditingController();
  File? image;

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPrice.dispose();
    _controllerOwners.dispose();
     _controllerTransmissionType.dispose();
     _controllerFuelType.dispose();
     _controllerkmsDriven.dispose();
    super.dispose();
  }

  Future<void> addUser() async {
    if (_formKey.currentState!.validate()) {
      String imageUrl = "";
      if (image != null) {
        imageUrl = await uploadImage(image!);
      }

      await FirebaseFirestore.instance.collection('Cars_list').add({
        'name': _controllerName.text,
        'price': _controllerPrice.text,
        'owners':_controllerOwners.text,
         'transmission':_controllerTransmissionType.text,
       'fuel':_controllerFuelType.text,
         'kmsDriven':_controllerkmsDriven.text,
        'imageUrl': imageUrl,
      });

      Navigator.pop(context);
    }
  }

  Future<String> uploadImage(File image) async {
    Reference reference = FirebaseStorage.instance.ref().child('images/${image.path}');
    UploadTask uploadTask = reference.putFile(image);
    await uploadTask.whenComplete(() => print('Image uploaded'));
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Cars'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerPrice,
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerOwners,
                decoration: const InputDecoration(
                  labelText: 'Owners',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerTransmissionType,
                decoration: const InputDecoration(
                  labelText: 'Transmission',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter transmission type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerFuelType,
                decoration: const InputDecoration(
                  labelText: 'Fuel',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fuel type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _controllerkmsDriven,
                decoration: const InputDecoration(
                  labelText: 'kmsDriven',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter kms Driven';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final imagePicker = ImagePicker();
                  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      image = File(pickedImage.path);
                    });
                  }
                },
                child: const Text('Add Image'),
              ),
              ElevatedButton(
                onPressed: addUser,
                child: const Text('Add User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}