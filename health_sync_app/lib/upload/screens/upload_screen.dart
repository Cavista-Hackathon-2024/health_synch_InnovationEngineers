// ignore_for_file: await_only_futures, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/upload/screens/upload_all.dart';
import 'package:health_sync_app/upload/screens/upload_med.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HealthColors.blue2,
        title: const Center(
          child: Text("Upload data"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            ListTile(
              tileColor: const Color.fromARGB(255, 206, 216, 234),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text(
                "Upload new medication",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: HealthColors.blue,
                child: IconButton(
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .getUserDetails;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadMed(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: const Color.fromARGB(255, 206, 216, 234),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text(
                "Upload new allergy",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: HealthColors.blue,
                child: IconButton(
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .getUserDetails;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadAllergy(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: const Color.fromARGB(255, 206, 216, 234),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text(
                "Upload new vitals",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: HealthColors.blue,
                child: IconButton(
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: const Color.fromARGB(255, 206, 216, 234),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: const Text(
                "Upload new condition",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: HealthColors.blue,
                child: IconButton(
                  icon: const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      backgroundColor: HealthColors.blue2,
    );
  }
}
