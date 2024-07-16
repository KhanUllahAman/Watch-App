// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Screens/Admin/admin_home.dart';
import 'package:insomnia_app/Services/helper_service.dart';
import 'package:insomnia_app/Widgets/custom_snackbar.dart';
import '../../Constants/app_styles.dart';
import '../../Services/auth_service.dart';
import '../../Services/database_service.dart';
import '../../Widgets/custom_elevated_button.dart';
import '../../Widgets/navigation.dart';

class AdminLogin extends StatefulWidget {
  static const String routeName = 'Admin-Login-Screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AdminLogin(),
    );
  }

  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isLoading = false;
  bool obscureText = false;
  bool isLoadingComplete = false;
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome Back Doc !",
                style: TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 28.sp,
                  color: AppStyles.onPrimary,
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      height: 40.h,
                    ),
                    // Sign Up Button
                    isLoading
                        ? const CircularProgressIndicator(
                            color: AppStyles.primaryColor,
                          )
                        : CustomElevatedButton(
                            onTap: () => login(), buttonName: "LOG IN"),

                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                  .gettingAdminData(email);
          // saving the values to our shared preferences
          try {
            if (snapshot.docs[0]['fullName'] != "") {
              await HelperService.saveUserEmailSF(email);
              await HelperService.saveUserNameSF(snapshot.docs[0]['fullName']);
              nextScreenReplace(
                context,
                const AdminHome(),
              );
            } else {
              showSnackbar(
                context,
                Colors.red,
                "You're not a Doctor.",
              );
            }
          } catch (e) {
            showSnackbar(
              context,
              Colors.red,
              e.toString(),
            );
          }
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
