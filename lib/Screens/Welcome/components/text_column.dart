import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Constants/app_styles.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "We are what we do",
          style: TextStyle(
            color: AppStyles.onPrimary,
            fontSize: 30.spMax,
            fontFamily: "Helvetica",
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Thousand of people are using Insomnia Tracker\nfor better sleeping perforance",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppStyles.onPrimary,
            fontSize: 16.spMax,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
