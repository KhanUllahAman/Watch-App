// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Screens/Survey/survey_form.dart';
import 'package:insomnia_app/Widgets/custom_elevated_button.dart';
import 'package:insomnia_app/Widgets/custom_snackbar.dart';
import 'package:insomnia_app/Widgets/social_signup_button.dart';
import 'package:insomnia_app/Widgets/text_button_row.dart';
import 'package:lottie/lottie.dart';

import '../../Services/auth_service.dart';
import '../../Services/helper_service.dart';
import '../../Widgets/back_arrow_icon.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'Sign-Up-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignUpScreen(),
    );
  }

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  String fullName = "";
  String email = "";
  String password = "";
  bool isLoading = false;
  bool privacyPolicyCheck = false;
  bool obscureText = false;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isLoading ? 0.4 : 1.0,
      child: Scaffold(
        body: Stack(
          children: [
            // First/ Bottom Layer
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
            // Second Layer
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const BackArrowIcon(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            // Create Account Text
                            Text(
                              "Create your account",
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
                              key: formkey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Name Field
                                    TextFormField(
                                      cursorColor: AppStyles.onPrimary,
                                      onChanged: (val) {
                                        setState(() {
                                          fullName = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return "Name cannot be empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Full Name",
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a password';
                                        }
                                        RegExp passwordRegex = RegExp(
                                            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                                        if (!passwordRegex.hasMatch(value)) {
                                          return 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character';
                                        }
                                        return null;
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButtonRow(
                                          text: "I have read the",
                                          buttonText: "Privacy Policy",
                                          onTap: () {},
                                        ),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: privacyPolicyCheck,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              privacyPolicyCheck = value!;
                                            });
                                          },
                                          activeColor: AppStyles.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                          ),
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    // Sign Up Button
                                    CustomElevatedButton(
                                        onTap: () => register(),
                                        buttonName: "GET STARTED"),
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
      ),
    );
  }

// Registering a User
  register() async {
    if (formkey.currentState!.validate() && privacyPolicyCheck == true) {
      setState(() {
        isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await HelperService.saveUserLoggedInStatus(true);
          await HelperService.saveUserEmailSF(email);
          await HelperService.saveUserNameSF(fullName);

          Future.delayed(
              const Duration(
                seconds: 2,
              ), () {
            Navigator.pushReplacementNamed(
              context,
              SurveyForm.routeName,
            );
          });
        } else {
          setState(() {
            isLoading = false;
          });

          showSnackbar(context, Colors.red, value);
        }
      });
    } else if (privacyPolicyCheck == false) {
      showSnackbar(context, Colors.red, "Check the Privacy Policy");
    }
  }
}
