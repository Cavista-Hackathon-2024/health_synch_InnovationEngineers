import 'package:flutter/material.dart';
import 'package:health_sync_app/ai_chat/gemini_chat.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/dashboard/dash_screen.dart';
import 'package:health_sync_app/dashboard/dashboard_provider.dart';
import 'package:health_sync_app/more/more_screen.dart';
import 'package:health_sync_app/upload/screens/upload_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = const [
    DashScreen(),
    UploadScreen(),
    MoreScreen(),
    GeminiPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DashProvider>(
      builder: (context, provider, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.selectedIndex,
          selectedItemColor: HealthColors.blue,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_upload_outlined,
              ),
              label: "Upload",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_sharp,
              ),
              label: "More",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline_rounded,
              ),
              label: "AI chat",
            ),
          ],
          onTap: (index) {
            Provider.of<DashProvider>(context, listen: false).onTapItem(index);
          },
        ),
        body: screens[provider.selectedIndex],
      ),
    );
  }
}
