// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  const CustomElevatedButton({
    Key? key,
    required this.onTap,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(373.w, 63.h),
        backgroundColor: AppStyles.primaryColor,
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 14.spMax,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: "Helvetica",
        ),
      ),
    );
  }
}
