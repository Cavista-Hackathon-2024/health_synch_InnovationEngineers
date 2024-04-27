// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_models.dart';
import 'package:health_sync_app/authentication/auth_utils.dart';
import 'package:health_sync_app/authentication/auth_widgets.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/home_screen.dart';

class AddInfoPage extends StatefulWidget {
  const AddInfoPage({super.key});

  @override
  State<AddInfoPage> createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emergencyNameController =
      TextEditingController();
  final TextEditingController _emergencyPhoneController =
      TextEditingController();
  final TextEditingController _emergencyAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Additional Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            const Text(
              "More about you",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Where do you stay?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: "123, Avenue Street, Ikoyi, Lagos",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: HealthColors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "What is your gender?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _genderController,
                decoration: InputDecoration(
                  hintText: "e.g Male, Female",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: HealthColors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Emergency Contact Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Emergency contact name:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _emergencyNameController,
                decoration: InputDecoration(
                  hintText: "e.g John Doe",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: HealthColors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Emergency contact phone:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: FormattedNumberFeild(
                controller: _emergencyPhoneController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Emergency contact address:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _emergencyAddressController,
                decoration: InputDecoration(
                  hintText: "123, Avenue Street, Ikoyi, Lagos",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(
                      color: HealthColors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(HealthColors.blue),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () async {
                String? myUId = await SecureStorage.getUid();
                if (_genderController.text.isNotEmpty &&
                        _genderController.text == "Male" ||
                    _genderController.text == "Female" &&
                        _addressController.text.isNotEmpty &&
                        _emergencyAddressController.text.isNotEmpty &&
                        _emergencyNameController.text.isNotEmpty &&
                        _emergencyPhoneController.text.isNotEmpty &&
                        _emergencyPhoneController.text
                                .replaceAll(r' ', "")
                                .length ==
                            14) {
                  if (myUId != null) {
                    try {
                      FirebaseFirestore.instance
                          .collection("Users")
                          .doc(myUId)
                          .update({
                        "gender": _genderController.text,
                        "address": _addressController.text,
                        "emergencyContact": EmergencyContact(
                          name: _emergencyNameController.text,
                          address: _emergencyAddressController.text,
                          phone: _emergencyPhoneController.text,
                        ).toJson(),
                      });
                      await SecureStorage.writeDob(" byft");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false);
                    } catch (e) {
                      throw '';
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("All fields are required."),
                    ),
                  );
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//DOB, Gender, Address, Emergency contact- (name, phone, address)
