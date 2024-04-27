import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_models.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/authentication/auth_utils.dart';
import 'package:health_sync_app/colors.dart';
import 'package:provider/provider.dart';

class DocDash extends StatefulWidget {
  const DocDash({super.key});

  @override
  State<DocDash> createState() => _DocDashState();
}

class _DocDashState extends State<DocDash> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getUserDetails();
  }

  Future future(myUId) async {
    var returnedDoc = await FirebaseFirestore.instance
        .collection("MedicConsultants")
        .doc(myUId)
        .get();

    return returnedDoc;
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height * 0.15),
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) => FutureBuilder(
            future: future(provider.myUId),
            builder: (context, snapshots) {
              Map<String, dynamic>? document;
              if (snapshots.hasData == true) {
                var thisDoc = snapshots.data?.data();
                document = {
                  "name": thisDoc["name"],
                  "medicalLicense": thisDoc["medicalLicense"],
                  "hospitalAffiliation": thisDoc["hospitalAffiliation"],
                };
              }
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Container(
                  color: HealthColors.blue,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: null,
                                  child: Text("")),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document != null
                                        ? document["name"]
                                        : "your_name",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    document != null
                                        ? "License: ${document["medicalLicense"]}"
                                        : "your_license",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: HealthColors.blue2,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Users").get(),
          builder: (context, snapshot) {
            var documents = snapshot.data?.docs;
            List<User> allPatients = [];
            if (documents != null) {
              for (var doc in documents) {
                var thisDoc = doc.data();
                if (thisDoc["uId"] != null) {
                  User patient = User.fromJson(thisDoc);
                  allPatients.add(patient);
                }
              }
            }
            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Top Patients",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SizedBox(
                                height: 250,
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Enter access key:"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.top,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          controller: _controller,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              borderSide: const BorderSide(
                                                color: HealthColors.blue,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey),
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
                                            Size(
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.6,
                                                50),
                                          ),
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  HealthColors.blue),
                                          foregroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        onPressed: () async {
                                          if (_controller.text.isNotEmpty) {
                                            for (var patient in allPatients) {
                                              if (patient.accessKey ==
                                                  _controller.text) {
                                                SecureStorage.storeUId(
                                                    patient.uId);
                                                Navigator.pop(context);
                                              }
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Fill all required parameters"),
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
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "New Patient",
                          style: TextStyle(
                            fontSize: 18,
                            color: HealthColors.blue,
                            decorationColor: HealthColors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: SecureStorage.getUIds(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData == true) {
                          List patients = jsonDecode(snapshot.data!);
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection("Users")
                                    .doc(patients[index])
                                    .get(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var thisDocument = snapshot.data?.data();
                                    User patient = User.fromJson(thisDocument!);
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: HealthColors.blue,
                                        child: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        patient.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      subtitle: Text(
                                        patient.gender!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              );
                            },
                            itemCount: patients.length,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
