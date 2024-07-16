import 'package:alarm/alarm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Screens/Survey/survey_form.dart';
import 'package:insomnia_app/Widgets/custom_nav_bar.dart';
import 'package:insomnia_app/firebase_options.dart';
import 'Routes/app_routes.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'Services/helper_service.dart';
import 'controllers/survery_controller.dart';

late String? myuid;
late String? myName;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  Get.put<UserController>(UserController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Alarm.init();
  await HelperService.getUserID().then((value) {
    if (value != "UID") {
      myuid = value;
      if (kDebugMode) {
        print(myuid);
      }
    }
  });
  await HelperService.getUserNameFromSF().then((value) {
    if (value != "") {
      myName = value;
      if (kDebugMode) {
        print(myName);
      }
    }
  });
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSignedIn = false;
  bool isSurveyFilled = false;

  Future<void> getUserLoggedInStatus() async {
    await HelperService.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isSignedIn = value;
        });
      }
    });
  }

  Future<void> getSurveyStatus() async {
    await HelperService.getSurveyStatus().then((value) {
      if (value != null) {
        setState(() {
          isSurveyFilled = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
    getSurveyStatus();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insomnia App',
        // home: isSignedIn ? const CustomNavBar() : const WelcomeScreen(),
        home: isSignedIn
            ? isSurveyFilled
                ? const CustomNavBar()
                : const SurveyForm()
            : const WelcomeScreen(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppStyles.primaryColor,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
