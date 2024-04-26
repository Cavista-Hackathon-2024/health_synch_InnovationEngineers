import 'package:flutter/material.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/dashboard/dashboard_provider.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashProvider>(
        builder: (context, provider, child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: HealthColors.blue,
          child: const SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                          radius: 40, backgroundImage: null, child: Text("")),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Name",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Rider ID: Not Assigned",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: SizedBox(
                    //     child: ToggleSwitch(
                    //       customTextStyles: const [
                    //         TextStyle(color: GustagoColors.white, fontSize: 15),
                    //         TextStyle(color: GustagoColors.black, fontSize: 15),
                    //       ],
                    //       minWidth: 90.0,
                    //       cornerRadius: 20.0,
                    //       activeBgColors: const [
                    //         [GustagoColors.grey2],
                    //         [GustagoColors.white]
                    //       ],
                    //       activeFgColor: Colors.white,
                    //       inactiveBgColor: Colors.grey,
                    //       inactiveFgColor: Colors.white,
                    //       initialLabelIndex: documents.isNotEmpty == true
                    //           ? document!.active == true
                    //               ? 1
                    //               : 0
                    //           : 0,
                    //       totalSwitches: 2,
                    //       labels: const ["OFF", 'ON'],
                    //       radiusStyle: true,
                    //       onToggle: (index) {
                    //         if (documents.isNotEmpty == true) {
                    //           if (document!.status == "Verified") {
                    //             if (document.active == false) {
                    //               FirebaseFirestore.instance
                    //                   .collection("Riders")
                    //                   .doc(
                    //                     Provider.of<DashProvider>(context,
                    //                             listen: false)
                    //                         .uId,
                    //                   )
                    //                   .update(
                    //                 {"active": true},
                    //               );
                    //             } else {
                    //               FirebaseFirestore.instance
                    //                   .collection("Riders")
                    //                   .doc(Provider.of<DashProvider>(context,
                    //                           listen: false)
                    //                       .uId)
                    //                   .update(
                    //                 {"active": false},
                    //               );
                    //             }
                    //           }
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("Orders")
                //       .where(
                //         "riderUId",
                //         isEqualTo: document != null ? document.uId : "",
                //       )
                //       .snapshots(),
                //   builder: (context, snapshot) {
                //     List reviewedDocuments = [];
                //     List<QueryDocumentSnapshot<Map<String, dynamic>>>
                //         documents = [];
                //     int rating = 0;
                //     if (snapshot.hasData) {
                //       documents = snapshot.data!.docs;
                //       for (var thisDocument in documents) {
                //         CheckoutModel newDocument = CheckoutModel.fromJson(
                //           thisDocument.data(),
                //         );
                //         if (newDocument.review != null) {
                //           if (newDocument.review!.riderRating != 0) {
                //             reviewedDocuments.add(newDocument);
                //             rating += newDocument.review!.riderRating;
                //           }
                //         }
                //       }
                //     }
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Text(
                //           "Total Deliveries: ${documents.length}",
                //           style: const TextStyle(
                //             fontSize: 18,
                //             color: GustagoColors.white,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //         Text(
                //           "Review rating: ${rating / reviewedDocuments.length}",
                //           style: const TextStyle(
                //             fontSize: 18,
                //             color: GustagoColors.white,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
