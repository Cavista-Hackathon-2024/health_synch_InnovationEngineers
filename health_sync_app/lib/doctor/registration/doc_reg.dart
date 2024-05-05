// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/doctor/doc_provider.dart';
import 'package:health_sync_app/doctor/doctor_main.dart';
import 'package:provider/provider.dart';

class DocRegister extends StatefulWidget {
  const DocRegister({super.key});

  @override
  State<DocRegister> createState() => _DocRegisterState();
}

class _DocRegisterState extends State<DocRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lincenseController = TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HealthColors.blue2,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Name",
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
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _nameController,
                decoration: InputDecoration(
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
              "Medical License",
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
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _lincenseController,
                decoration: InputDecoration(
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
              "Hospital Affiliation(optional)",
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
                textAlignVertical: TextAlignVertical.top,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                controller: _hospitalController,
                decoration: InputDecoration(
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
                if (_nameController.text.isNotEmpty &&
                    _lincenseController.text.isNotEmpty) {
                  String? response =
                      await Provider.of<DocProvider>(context, listen: false)
                          .onboardDoc(
                              _nameController.text,
                              _lincenseController.text,
                              _hospitalController.text,
                              Provider.of<AuthProvider>(context, listen: false)
                                  .myUId);

                  if (response != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorMainScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Upload failed"),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Fill all required parameters"),
                  ));
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


// medicId, name, medicLicense, hospitalAffiliation