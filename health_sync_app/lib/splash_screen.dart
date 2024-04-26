import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Timer(const Duration(seconds: 3), () async {
          await Provider.of<AuthProvider>(context, listen: false)
              .signIn()
              .then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    (Provider.of<AuthProvider>(context).openingPage),
              ),
            );
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Image.asset(
          "assets/splash.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
