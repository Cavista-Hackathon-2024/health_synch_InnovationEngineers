import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploadProvider extends ChangeNotifier {
  Future<String?> uploadMed(
      name, instruction, healthAuthority, date, myUId) async {
    final random = Random.secure();
    const length = 6;
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final string = String.fromCharCodes(List.generate(
        length, (index) => chars.codeUnitAt(random.nextInt(chars.length))));
    try {
      await FirebaseFirestore.instance
          .collection("Medications")
          .doc(myUId)
          .update({
        string: {
          "name": name,
          "instruction": instruction,
          "healthAuthority": healthAuthority,
          "date": date
        }
      });
      return "Success";
    } catch (e) {
      throw '';
    }
  }

  Future<String?> uploadAllergies(description, symptoms, myUId) async {
    final random = Random.secure();
    const length = 6;
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final string = String.fromCharCodes(List.generate(
        length, (index) => chars.codeUnitAt(random.nextInt(chars.length))));
    try {
      await FirebaseFirestore.instance
          .collection("Allergies")
          .doc(myUId)
          .update({
        string: {
          "description": description,
          "symptoms": symptoms,
        }
      });
      return "Success";
    } catch (e) {
      throw '';
    }
  }

  void uploadCondition(name, condition, date, myUId) {
    final random = Random.secure();
    const length = 6;
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final string = String.fromCharCodes(List.generate(
        length, (index) => chars.codeUnitAt(random.nextInt(chars.length))));
    try {
      FirebaseFirestore.instance.collection("Conditions").doc(myUId).update({
        string: {
          "name": name,
          "condition": condition,
          "date": date,
        }
      });
    } catch (e) {
      throw '';
    }
  }

  // void uploadVit(bp, date) {
  //   try {} catch (e) {}
  // }
}
