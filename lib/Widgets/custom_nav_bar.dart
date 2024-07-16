import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Screens/Doctor/doctor_screen.dart';
import 'package:insomnia_app/Screens/Remedies/remedies_screen.dart';
import 'package:insomnia_app/Screens/Sleep/sleep_tracker_screen.dart';
import 'package:insomnia_app/Screens/Sounds/sounds_screen.dart';
import 'package:insomnia_app/Screens/User/user_screen.dart';

class CustomNavBar extends StatefulWidget {
  static const String routeName = 'custom-nav-bar';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CustomNavBar(),
    );
  }

  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final PageController controller = PageController();
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    SoundsScreen(),
    RemediesScreen(),
    DoctorScreen(),
    SleepTrackerScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 120.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              if (kDebugMode) {
                print(selectedIndex);
              }
            });
          },
          unselectedItemColor: AppStyles.onPrimary,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 30.sp,
          ),
          unselectedIconTheme: IconThemeData(
            color: AppStyles.onPrimary,
            size: 24.sp,
          ),
          unselectedLabelStyle: TextStyle(
            color: AppStyles.onPrimary,
            fontSize: 14.sp,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: true,
          items: [
            // Sounds Item
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.music_note_outlined,
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: const Icon(
                    Icons.music_note_outlined,
                    color: Colors.white,
                  ),
                ),
                label: "Sounds"),
            // Rememdies Item
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.medication_liquid_outlined,
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: const Icon(
                    Icons.medication_liquid_outlined,
                    color: Colors.white,
                  ),
                ),
                label: "Remedies"),
            // Doctor Consultation Item
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.medical_services_outlined,
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: const Icon(
                    Icons.medical_services_outlined,
                    color: Colors.white,
                  ),
                ),
                label: "Doctor "),
            // Sleep Tracker Item
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.track_changes_rounded,
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: const Icon(
                    Icons.track_changes_rounded,
                    color: Colors.white,
                  ),
                ),
                label: "Sleep Tracker"),
            // User Profile Item
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person_2_outlined,
                ),
                activeIcon: Container(
                  padding: EdgeInsets.all(
                    15.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white,
                  ),
                ),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
