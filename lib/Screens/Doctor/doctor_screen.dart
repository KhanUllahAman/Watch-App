// ignore_for_file: use_build_context_synchronously, prefer_final_fields, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Services/helper_service.dart';
import '../../Services/auth_service.dart';
import '../../Services/database_service.dart';
import '../../Widgets/custom_nav_bar.dart';
import '../../Widgets/group_tile.dart';
import '../../Widgets/navigation.dart';
import 'buy_premium_screen.dart';
import 'card_details.dart';
import 'components/validation_container.dart';
import 'search_page.dart';

class DoctorScreen extends StatefulWidget {
  static const String routeName = 'Doctor-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DoctorScreen(),
    );
  }

  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final PageController controller = PageController();
  bool isUserPremium = false;

  Future<void> getUserPaymentStatus() async {
    await HelperService.getIsPremiumUser().then((value) {
      if (value != null) {
        setState(() {
          isUserPremium = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserPaymentStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isUserPremium
          ? const DoctorChatScreen()
          : PageView(
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              controller: controller,
              children: <Widget>[
                BuyPremiumScreen(controller: controller),
                CardDetailsScreen(controller: controller),
              ],
            ),
    );
  }
}

class DoctorChatScreen extends StatefulWidget {
  const DoctorChatScreen({super.key});

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? groups;
  bool _isLoading = false;
  String groupName = "";
  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperService.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperService.getUserNameFromSF().then((val) {
      setState(() {
        userName = val!;
      });
    });
    // getting the list of snapshots in our stream
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: AppStyles().headerTextStyle.copyWith(
              color: AppStyles.primaryColor,
              fontSize: 14.sp,
            ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Unsubscribe",
        style: AppStyles().headerTextStyle.copyWith(
              color: AppStyles.primaryColor,
              fontSize: 14.sp,
            ),
      ),
      onPressed: () async {
        await HelperService.saveIsPremiumUser(false);
        Navigator.pushReplacementNamed(
          context,
          CustomNavBar.routeName,
        );
        await showDialog(
            barrierColor: Colors.black54,
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const ValidationContainer(
                icon: Icons.check_circle,
                iconColor: Colors.green,
                text: 'Successful!',
                description: "Unsubscribed Successfully!",
                buttonTitle: 'Close',
              );
            });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirmation",
        style: AppStyles().headerTextStyle.copyWith(
              color: AppStyles.primaryColor,
              fontSize: 18.sp,
            ),
      ),
      content: Text(
        "Are you sure you want to unsubscribe? This cannot be undone.",
        style: AppStyles().bodyTextStyle.copyWith(
              color: AppStyles.onPrimary,
            ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            nextScreen(context, const SearchPage());
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () async {
              // await HelperService.saveIsPremiumUser(false);
              showAlertDialog(context);
            },
            child: Text(
              "Unsubscribe",
              style: AppStyles().headerTextStyle.copyWith(
                    color: AppStyles.primaryColor,
                    fontSize: 18.sp,
                  ),
            ),
          )
        ],
      ),
      body: groupList(),
    );
  }

  groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        // make some checks
        if (snapshot.hasData) {
          if (snapshot.data['groups'] != null) {
            if (snapshot.data['groups'].length != 0) {
              return ListView.builder(
                itemCount: snapshot.data['groups'].length,
                itemBuilder: (context, index) {
                  int reverseIndex = snapshot.data['groups'].length - index - 1;
                  return GroupTile(
                      isAdmin: false,
                      groupId: getId(snapshot.data['groups'][reverseIndex]),
                      groupName: getName(snapshot.data['groups'][reverseIndex]),
                      userName: snapshot.data['fullName']);
                },
              );
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppStyles.primaryColor),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return GestureDetector(
      onTap: () {
        nextScreen(
          context,
          const SearchPage(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 50,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "You've not joined any Chats, tap on the search button and search doctors.",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
