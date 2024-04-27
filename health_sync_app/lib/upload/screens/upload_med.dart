// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/dashboard/dashboard_provider.dart';
import 'package:health_sync_app/upload/upload_provider.dart';
import 'package:provider/provider.dart';

// {
//   "name": name,
//   "instruction": instruction,
//   "healthAuthority": healthAuthority,
//   "date": date
// }
class UploadMed extends StatefulWidget {
  const UploadMed({super.key});
  @override
  State<UploadMed> createState() => _UploadMedState();
}

class _UploadMedState extends State<UploadMed> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();
  final TextEditingController _healthAuthority = TextEditingController();
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
                "Name of medication",
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "e.g Paracetamol",
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
                "Healthcare Provider",
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
                  controller: _healthAuthority,
                  decoration: InputDecoration(
                    hintText: "e.g OneHealth Pharmacy",
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
                "Healthcare Provider Instructions",
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
                  controller: _instructionController,
                  decoration: InputDecoration(
                    hintText: "e.g 2 tablets per day",
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
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    if (_nameController.text.isNotEmpty &&
                        _healthAuthority.text.isNotEmpty) {
                      final now = DateTime.now();
                      final formattedTime = formatDateDdMmYy(now);

                      String? response = await Provider.of<UploadProvider>(
                              context,
                              listen: false)
                          .uploadMed(
                              _nameController.text,
                              _instructionController.text,
                              _healthAuthority.text,
                              formattedTime,
                              myUId);
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
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
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
