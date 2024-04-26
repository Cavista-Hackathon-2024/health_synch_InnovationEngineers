import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/add_info_screen.dart';
import 'package:health_sync_app/authentication/auth_utils.dart';
import 'package:health_sync_app/authentication/onboarding.dart';
import 'package:health_sync_app/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  String? myUId;
  Widget openingPage = const OnboardingScreen();
  Future<void> signIn() async {
    String? uId = await SecureStorage.getUid();
    String? dob = await SecureStorage.getDob();
    if (uId != null && dob != null) {
      openingPage = const HomeScreen();
    } else if (uId != null) {
      openingPage = const AddInfoPage();
    } else {
      openingPage = const OnboardingScreen();
    }
  }

  void getUserDetails() async {
    myUId = await SecureStorage.getUid();
    notifyListeners();
  }
}
