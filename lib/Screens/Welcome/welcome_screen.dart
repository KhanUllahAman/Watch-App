// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Screens/Login/login_screen.dart';
import 'package:insomnia_app/Screens/Signup/signup_screen.dart';

import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/text_button_row.dart';
import 'components/logo_row.dart';
import 'components/text_column.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = 'Welcome-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WelcomeScreen(),
    );
  }

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Back Frame
          Container(
            alignment: Alignment.topCenter,
            height: 504.h,
            width: 450.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppStyles.frame),
              fit: BoxFit.cover,
            )),
          ),
          SafeArea(
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    // Logo Row
                    const LogoRow(),
                    SizedBox(
                      height: 80.h,
                    ),
                    // OnBoarding Image
                    Container(
                      height: 242.69.h,
                      width: 332.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppStyles.onboardingImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    // Text Column
                    const TextColumn(),
                    SizedBox(
                      height: 100.h,
                    ),
                    // Sign Up Button
                    CustomElevatedButton(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SignUpScreen.routeName,
                        );
                      },
                      buttonName: "SIGN UP",
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Login Button Row
                    TextButtonRow(
                      text: "ALREADY HAVE AN ACCOUNT?",
                      buttonText: "LOG IN",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          LoginScreen.routeName,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
