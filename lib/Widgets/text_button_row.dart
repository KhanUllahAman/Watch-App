// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/app_styles.dart';

class TextButtonRow extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onTap;
  const TextButtonRow({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.spMax,
            fontWeight: FontWeight.w400,
            color: AppStyles.onPrimary,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 14.spMax,
              fontWeight: FontWeight.bold,
              color: AppStyles.primaryColor,
              fontFamily: "Helvetica",
            ),
          ),
        ),
      ],
    );
  }
}
