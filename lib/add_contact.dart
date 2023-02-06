import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddContact extends StatefulWidget {
  AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final nameController = TextEditingController();
  final contactNumberController = TextEditingController();
  String name = '';
  int phone_number = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),

            // Name Entry
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Enter Name",
              ),
              onChanged: (value) {
                name = value;
              },
            ),

            // Contact Number Entry
            TextField(
              controller: contactNumberController,
              keyboardType: TextInputType.phone,
              decoration:
                  const InputDecoration(labelText: "Enter Contact Number"),
              onChanged: (value) {
                phone_number = int.parse(value);
              },
            ),

            SizedBox(
              height: height * 0.1,
            ),

            // Submit Button
            ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'Name': 'Ishu',
                    'Phone_Number ': 1017842842,
                  }).then((value) => print('user added'));
                },
                child: const Text("ADD"))
          ],
        ),
      ),
    );
  }
}
