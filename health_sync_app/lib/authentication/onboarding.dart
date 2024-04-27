import 'package:flutter/material.dart';
import 'package:health_sync_app/authentication/add_info_screen.dart';
import 'package:health_sync_app/authentication/auth_utils.dart';
import 'package:health_sync_app/colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Health Synch",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Let's get you started.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: HealthColors.blue),
                  ),
                ),
                foregroundColor:
                    const MaterialStatePropertyAll(HealthColors.blue),
              ),
              onPressed: () {
                SecureStorage().storeGoogleUser(context).then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddInfoPage(),
                    ),
                  );
                });
              },
              child: const Text(
                "Google Sign In",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                ),
                backgroundColor:
                    const MaterialStatePropertyAll(HealthColors.blue),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: const Text(
                "Login with Email",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(MediaQuery.sizeOf(context).width * 0.6, 50),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: HealthColors.blue),
                  ),
                ),
                foregroundColor:
                    const MaterialStatePropertyAll(HealthColors.blue),
              ),
              onPressed: () {},
              child: const Text(
                "Email Sign up",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: HealthColors.blue2,
    );
  }
}
