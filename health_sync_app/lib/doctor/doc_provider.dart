import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DocProvider extends ChangeNotifier {
  int selectedIndex = 0;
  void onTapItem(index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<String?> onboardDoc(String name, String medicalLicense,
      String? hospitalAffiliation, myUId) async {
    try {
      await FirebaseFirestore.instance
          .collection("MedicConsultants")
          .doc(myUId)
          .set({
        "name": name,
        "medicalLicense": medicalLicense,
        "hospitalAffiliation": hospitalAffiliation,
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(myUId)
          .update({"isMedic": true});
      return "Success";
    } catch (e) {
      throw '';
    }
  }
}
