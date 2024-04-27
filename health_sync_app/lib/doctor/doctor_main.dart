import 'package:flutter/material.dart';
import 'package:health_sync_app/colors.dart';
import 'package:health_sync_app/doctor/doc_dash.dart';
import 'package:health_sync_app/doctor/doc_more.dart';
import 'package:health_sync_app/doctor/doc_provider.dart';
import 'package:health_sync_app/doctor/doc_upload.dart';
import 'package:provider/provider.dart';

class DoctorMainScreen extends StatefulWidget {
  const DoctorMainScreen({super.key});

  @override
  State<DoctorMainScreen> createState() => _DoctorMainScreenState();
}

// dashboard: Top patients...
// patients, upload data, access, dashboard.
class _DoctorMainScreenState extends State<DoctorMainScreen> {
  List screens = const [
    DocDash(),
    DocUpload(),
    DocMore(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<DocProvider>(
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
          ],
          onTap: (index) {
            Provider.of<DocProvider>(context, listen: false).onTapItem(index);
          },
        ),
        body: screens[provider.selectedIndex],
      ),
    );
  }
}
