import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  EditItem(this._carsItem, {Key? key}) {
    _controllerName = TextEditingController(text: _carsItem['name']);
    _controllerPrice = TextEditingController(text: _carsItem['price']);
    _controllerOwners = TextEditingController(text: _carsItem['owner']);
    _controllerTransmissionType =
        TextEditingController(text: _carsItem['transmissionType']);
    _controllerFuelType = TextEditingController(text: _carsItem['fuel']);
    _controllerkmsDriven = TextEditingController(text: _carsItem['kms driven']);

    _reference =
        FirebaseFirestore.instance.collection('cars_list').doc(_carsItem['id']);
  }

  Map _carsItem;
  late DocumentReference _reference;

  late TextEditingController _controllerName;
  late TextEditingController _controllerPrice;
  late TextEditingController _controllerOwners;
  late TextEditingController _controllerTransmissionType;
  late TextEditingController _controllerFuelType;
  late TextEditingController _controllerkmsDriven;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(children: [
            TextFormField(
              controller: _controllerName,
              decoration:
                  InputDecoration(hintText: 'Enter the name of the item'),
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
                  InputDecoration(hintText: 'Enter the price of the item'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item quantity';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _controllerOwners,
              decoration: InputDecoration(hintText: 'Enter the owners'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item name';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _controllerTransmissionType,
              decoration:
                  InputDecoration(hintText: 'Enter the Transmission Type'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item name';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _controllerFuelType,
              decoration: InputDecoration(hintText: 'Enter the Fueltype'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item name';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _controllerName,
              decoration:
                  InputDecoration(hintText: 'Enter the name of the item'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item name';
                }

                return null;
              },
            ),
            TextFormField(
              controller: _controllerkmsDriven,
              decoration: InputDecoration(hintText: 'Enter Kilometers driven'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the item name';
                }

                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    String name = _controllerName.text;
                    String price = _controllerPrice.text;
                    String owner = _controllerOwners.text;
                    String transmission = _controllerTransmissionType.text;
                    String kms_driven = _controllerkmsDriven.text;

                    // String
                    Map<String, String> dataToUpdate = {
                      'name': name,
                      'price': price,
                      'owner': owner,
                      'transmission': transmission,
                      'kilometers driven': kms_driven
                    };


                    //Call update()
                    _reference.update(dataToUpdate);
                  }
                },
                child: Text('Submit'))
          ]),
        ),
      ),
    );
  }
}
