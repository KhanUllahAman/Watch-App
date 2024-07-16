// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:insomnia_app/Screens/Admin/admin_login.dart';
import 'package:insomnia_app/Screens/Signup/signup_screen.dart';
import 'package:insomnia_app/Services/auth_service.dart';
import 'package:insomnia_app/Widgets/custom_nav_bar.dart';
import 'package:insomnia_app/Widgets/text_button_row.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/app_styles.dart';
import '../../Services/database_service.dart';
import '../../Services/helper_service.dart';
import '../../Widgets/back_arrow_icon.dart';
import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/custom_snackbar.dart';
import '../../Widgets/navigation.dart';
import '../../Widgets/social_signup_button.dart';
import '../../main.dart';
import '../Admin/admin_home.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isLoading = false;
  bool obscureText = false;
  bool isLoadingComplete = false;
  final AuthService authService = AuthService();

  bool isAdminSignedIn = false;

  Future<void> getAdminLoggedInStatus() async {
    await HelperService.getAdminLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isAdminSignedIn = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getAdminLoggedInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: isLoading ? 0.4 : 1.0,
        child: Scaffold(
          body: Stack(
            children: [
              // First Layer
              Container(
                height: 350.h,
                width: 500.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppStyles.backFrame,
                    ),
                  ),
                ),
              ),
              // Second/ Main Layer
              SafeArea(
                child: AnimationLimiter(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const BackArrowIcon(),
                              ),
                              TextButton(
                                onPressed: () {
                                  isAdminSignedIn
                                      ? nextScreenReplace(
                                          context,
                                          const AdminHome(),
                                        )
                                      : Navigator.pushNamed(
                                          context,
                                          AdminLogin.routeName,
                                        );
                                },
                                child: Text(
                                  "Admin Login",
                                  style: AppStyles().headerTextStyle.copyWith(
                                        fontSize: 18.sp,
                                        color: AppStyles.primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50.h,
                              ),
                              // Create Account Text
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontSize: 28.sp,
                                  color: AppStyles.onPrimary,
                                ),
                              ),

                              SizedBox(
                                height: 30.h,
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Text(
                                  "LOGIN WITH EMAIL",
                                  style: TextStyle(
                                    color: AppStyles.onPrimary,
                                    fontSize: 14.sp,
                                    letterSpacing: 1.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              // SignUp Form
                              Form(
                                key: formKey,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Email Field
                                      TextFormField(
                                        cursorColor: AppStyles.onPrimary,
                                        onChanged: (val) {
                                          setState(() {
                                            email = val;
                                          });
                                        },

                                        // check the validation
                                        validator: (val) {
                                          return RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(val!)
                                              ? null
                                              : "Please enter a valid email";
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          filled: true,
                                          fillColor: const Color(0xffF2F3F7),
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.red,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      // Password Field
                                      TextFormField(
                                        cursorColor: AppStyles.onPrimary,
                                        validator: (val) {
                                          if (val!.length < 6) {
                                            return "Password must be at least 6 characters";
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            password = val;
                                          });
                                        },
                                        obscureText: obscureText,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                obscureText = !obscureText;
                                              });
                                            },
                                            icon: Icon(
                                              obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                          ),
                                          hintText: "Password",
                                          filled: true,
                                          fillColor: const Color(0xffF2F3F7),
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.transparent,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1.w,
                                              color: Colors.red,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      // Sign Up Button
                                      CustomElevatedButton(
                                          onTap: () => login(),
                                          buttonName: "LOG IN"),
                                      TextButtonRow(
                                        text: "DON'T HAVE AN ACCOUNT?",
                                        buttonText: "SIGN UP",
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            SignUpScreen.routeName,
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      // Sign Up With Facebook
                                      SocialSignupButton(
                                        textColor: Colors.white,
                                        imageUrl: AppStyles.facebook,
                                        buttonName: "CONTINUE WITH FACEBOOK",
                                        color: const Color(0xff7583CA),
                                        borderColor: Colors.transparent,
                                        onPress: () {},
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      // Sign Up With Google
                                      SocialSignupButton(
                                        imageUrl: AppStyles.google,
                                        buttonName: "CONTINUE WITH GOOGLE",
                                        color: Colors.white,
                                        textColor: Colors.black,
                                        onPress: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Loading Widget
              isLoading
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            AppStyles.loadingAnimation,
                            repeat: true,
                            height: 80.h,
                            width: 80.w,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ));
  }

// Login
  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperService.saveUserLoggedInStatus(true);
          await HelperService.saveUserEmailSF(email);
          await HelperService.saveUserNameSF(snapshot.docs[0]['fullName']);
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
          setState(() {
            isLoading = false;
            isLoadingComplete = true;
          });
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Navigator.pushReplacementNamed(
                context,
                CustomNavBar.routeName,
              );
            },
          );
        } else {
          setState(() {
            isLoading = false;
          });
          showSnackbar(context, Colors.red, value);
        }
      });
    }
  }
}
