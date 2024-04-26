import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_models.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getUserDetails();
  }

  Future future(myUId) async {
    var returnedDoc =
        await FirebaseFirestore.instance.collection("Users").doc(myUId).get();

    return returnedDoc;
  }

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
              User? document;
              if (snapshots.hasData == true) {
                var thisDoc = snapshots.data!.data();
                document = User(
                  name: thisDoc["name"],
                  gmail: thisDoc["gmail"],
                  uId: thisDoc["uId"],
                  address: thisDoc["address"],
                  dob: thisDoc["dob"],
                  emergencyContact:
                      EmergencyContact.fromJson(thisDoc["emergencyContact"]),
                  gender: thisDoc["gender"],
                );
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
                                        ? document.name
                                        : "your_name",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Row(
                                      children: [
                                        Text(
                                          "View personal details",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Roboto",
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
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
      body: const TabView(),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Conditions"),
              Tab(text: "Medications"),
              Tab(text: "Allergies"),
              Tab(text: "Vitals"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SizedBox(),
            MedTab(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class MedTab extends StatelessWidget {
  const MedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) => FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("Medications")
              .doc(provider.myUId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.data() == null) {
                return Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: HealthColors.blue,
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Add new document",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                // var documents = snapshot.data!.data();
                return ListView.builder(
                  itemBuilder: (context, index) => const SizedBox(),
                  itemCount: 1,
                );
              }
            } else {
              return const Text("");
            }
          }),
    );
  }
}
// Medications doc(uId)-- List of medObjects(name, dosage)
// Allergies doc(uId)-- List of string
// Vitals doc(uId) -- Object of vitals--- String BP, String temp, String heart rate, Breathing rate,
