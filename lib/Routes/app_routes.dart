import 'package:flutter/material.dart';
import 'package:insomnia_app/Screens/Admin/admin_home.dart';
import 'package:insomnia_app/Screens/Admin/admin_login.dart';
import 'package:insomnia_app/Screens/Doctor/doctor_screen.dart';
import 'package:insomnia_app/Screens/Home/home_screen.dart';
import 'package:insomnia_app/Screens/Login/login_screen.dart';
import 'package:insomnia_app/Screens/Remedies/remedies_screen.dart';
import 'package:insomnia_app/Screens/Signup/signup_screen.dart';
import 'package:insomnia_app/Screens/Sleep/sleep_tracker_screen.dart';
import 'package:insomnia_app/Screens/Sounds/sounds_screen.dart';
import 'package:insomnia_app/Screens/Splash/splash_screen.dart';
import 'package:insomnia_app/Screens/Survey/survey_form.dart';
import 'package:insomnia_app/Screens/User/Notes/create_note.dart';
import 'package:insomnia_app/Screens/User/Notes/sleep_notes.dart';
import 'package:insomnia_app/Screens/User/Smart%20Alarm/smart_alarm.dart';
import 'package:insomnia_app/Screens/User/stories.dart';
import 'package:insomnia_app/Screens/Welcome/welcome_screen.dart';
import 'package:insomnia_app/Widgets/custom_nav_bar.dart';

import '../Screens/User/tips.dart';
import '../Screens/User/user_screen.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case CustomNavBar.routeName:
        return CustomNavBar.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SoundsScreen.routeName:
        return SoundsScreen.route();
      case RemediesScreen.routeName:
        return RemediesScreen.route();
      case DoctorScreen.routeName:
        return DoctorScreen.route();
      case SleepTrackerScreen.routeName:
        return SleepTrackerScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case StoriesScreen.routeName:
        return StoriesScreen.route();
      case NotesScreen.routeName:
        return NotesScreen.route();
      case SmartAlarm.routeName:
        return SmartAlarm.route();
      case Tips.routeName:
        return Tips.route();
      case CreateNoteView.routeName:
        return CreateNoteView.route();
      case AdminLogin.routeName:
        return AdminLogin.route();
      case AdminHome.routeName:
        return AdminHome.route();
      case SurveyForm.routeName:
        return SurveyForm.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
