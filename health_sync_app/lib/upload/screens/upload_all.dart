// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/upload/upload_provider.dart';
import 'package:provider/provider.dart';

// {
//   "description": description,
//   "symptoms": symptoms.
// }
class UploadAllergy extends StatefulWidget {
  const UploadAllergy({
    super.key,
  });
  @override
  State<UploadAllergy> createState() => _UploadAllergyState();
}

class _UploadAllergyState extends State<UploadAllergy> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? myUId = Provider.of<AuthProvider>(context).myUId;
    return Scaffold(
      body: ClipRRect(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [CloseButton()],
              ),
              const Text(
                "Name or Description",
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
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: "e.g Pollen allergy",
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
                "Symptoms",
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
                  controller: _symptomsController,
                  decoration: InputDecoration(
                    hintText: "e.g Sneezing, runny nose etc.",
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    if (_descriptionController.text.isNotEmpty &&
                        _symptomsController.text.isNotEmpty) {
                      String? response = await Provider.of<UploadProvider>(
                              context,
                              listen: false)
                          .uploadAllergies(
                        _descriptionController.text,
                        _symptomsController.text,
                        myUId,
                      );

                      if (response != null) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Upload failed"),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Fill all required parameters"),
                      ));
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(HealthColors.blue),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: HealthColors.blue2,
    );
  }
}
