// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Screens/User/Notes/sleep_notes.dart';
import 'package:insomnia_app/Screens/User/Smart%20Alarm/smart_alarm.dart';
import 'package:insomnia_app/Screens/User/stories.dart';
import 'package:insomnia_app/Screens/Welcome/welcome_screen.dart';
import 'package:insomnia_app/Services/auth_service.dart';
import 'package:insomnia_app/main.dart';

import '../../Constants/app_styles.dart';
import 'components/custom_listtile.dart';

class UserScreen extends StatefulWidget {
  static const String routeName = 'User-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const UserScreen(),
    );
  }

  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        title: Text(
          'Profile',
          style: AppStyles().headerTextStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () async {
                await authService.signOut();
                Navigator.pushReplacementNamed(
                  context,
                  WelcomeScreen.routeName,
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: AppStyles.onPrimary,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Logout",
                    style: AppStyles().headerTextStyle.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          // Spacing
          SizedBox(
            height: 30.h,
          ),
          CircleAvatar(
            radius: 50.r,
            backgroundImage: const AssetImage(
              AppStyles.userPlaceholder,
            ),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            myName!,
            style: AppStyles().headerTextStyle,
          ),
          SizedBox(
            height: 60.h,
          ),
          CustomListTile(
            title: "Stories",
            icon: Icons.book_outlined,
            onpress: () {
              Navigator.pushNamed(
                context,
                StoriesScreen.routeName,
              );
            },
          ),
          CustomListTile(
            title: "Sleep Notes",
            icon: Icons.note_alt_outlined,
            onpress: () {
              Navigator.pushNamed(
                context,
                NotesScreen.routeName,
              );
            },
          ),
          CustomListTile(
            title: "Smart Alarm",
            icon: Icons.alarm,
            onpress: () {
              Navigator.pushNamed(
                context,
                SmartAlarm.routeName,
              );
            },
          ),
          // CustomListTile(
          //   title: "Tips",
          //   icon: Icons.tips_and_updates_outlined,
          //   onpress: () {
          //     Navigator.pushNamed(
          //       context,
          //       Tips.routeName,
          //     );
          //   },
          // ),
          CustomListTile(
            title: "Invite a friend",
            icon: Icons.share_outlined,
            onpress: () {},
          ),
        ],
      )),
    );
  }
}
