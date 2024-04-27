import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as authentication;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_sync_app/authentication/auth_models.dart';

final db = FirebaseFirestore.instance;

class AuthUtils {
  static Future<authentication.UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = authentication.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await authentication.FirebaseAuth.instance
        .signInWithCredential(credential);
  }
}

class SecureStorage {
  static String keyUId = "key UID";
  static String keyDob = "key dob";
  static String keyUIds = "key uIds";

  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Future<void> storeGoogleUser(context) async {
    final random = Random.secure();
    const length = 6;
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final string = String.fromCharCodes(List.generate(
        length, (index) => chars.codeUnitAt(random.nextInt(chars.length))));
    try {
      authentication.UserCredential userCredential =
          await AuthUtils.signInWithGoogle();
      String uId = userCredential.user!.uid;
      await secureStorage.write(key: keyUId, value: uId);
      String name = userCredential.user!.providerData[0].displayName!;
      String gmail = userCredential.user!.email!;

      db.collection("Users").doc(uId).set(
            User(name: name, gmail: gmail, uId: uId, accessKey: "HS-$string")
                .toJson(),
          );
    } catch (e) {
      throw '';
    }
  }

  static storeUId(String uId) async {
    String? uIdList = await secureStorage.read(key: keyUIds);

    if (uIdList != null) {
      List oldList = jsonDecode(uIdList);
      if (oldList.contains(uId) != true) {
        oldList.add(uId);
        String newList = jsonEncode(oldList);

        secureStorage.write(key: keyUIds, value: newList);
      }
    } else {
      List oldList = [];
      oldList.add(uId);
      String newList = jsonEncode(oldList);
      await secureStorage.write(key: keyUIds, value: newList);
    }
  }

  static Future<String?> getUIds() async {
    return await secureStorage.read(key: keyUIds);
  }

  static Future<String?> getUid() async {
    return await secureStorage.read(key: keyUId);
  }

  static Future<String?> getDob() async {
    return await secureStorage.read(key: keyDob);
  }

  static writeDob(String dob) {
    secureStorage.write(key: keyDob, value: "njja");
  }

  static signOutUser() async {
    final authentication.FirebaseAuth auth =
        authentication.FirebaseAuth.instance;
    await secureStorage.delete(key: keyUId);
    auth.signOut();
  }
}
