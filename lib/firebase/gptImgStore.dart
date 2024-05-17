import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;

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

  runApp(MaterialApp(home: UploadDataScreen()));
}

class UploadDataScreen extends StatefulWidget {
  @override
  _UploadDataScreenState createState() => _UploadDataScreenState();
}

class _UploadDataScreenState extends State<UploadDataScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
 final TextEditingController _controllerName = TextEditingController();
final  TextEditingController _controllerPrice = TextEditingController();
 final TextEditingController _controllerOwners = TextEditingController();
final  TextEditingController _controllerTransmissionType = TextEditingController();
 final TextEditingController _controllerFuelType = TextEditingController();
 final TextEditingController _controllerkmsDriven = TextEditingController();

  Future<void> _pickImage() async {
    try {
      final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        setState(() {
          _imageFile = selectedImage;
        });
      }
    } catch (e) {
      // Handle any errors here
      print(e);
    }
  }

  Future<void> _uploadData() async {
    if (_imageFile == null || _textController.text.isEmpty) return;

    String textData = _textController.text;
    File file = File(_imageFile!.path);
    String fileName = path.basename(file.path);

    try {
      // Upload image to Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('uploads/$fileName');
      UploadTask uploadTask = storageReference.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      // Get image URL
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      // Upload text data and image URL to Firestore
      await FirebaseFirestore.instance.collection('Cars_list').add({
        'text': textData,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Data uploaded successfully.');
    } catch (e) {
      // Handle any errors here
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter some text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            _imageFile != null ? Image.file(File(_imageFile!.path)) : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Upload Data'),
            ),
          ],
        ),
      ),
    );
  }
}
