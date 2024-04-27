import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_app/authentication/auth_provider.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/const.dart';
import 'package:health_sync_app/dashboard/dashboard_provider.dart';
import 'package:health_sync_app/doctor/doc_provider.dart';
import 'package:health_sync_app/firebase_options.dart';
import 'package:health_sync_app/splash_screen.dart';
import 'package:health_sync_app/upload/upload_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(
    apiKey: geminikey,
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DashProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UploadProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DocProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HealthColors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
