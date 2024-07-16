import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/app_styles.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Insomnia",
            style: TextStyle(
              fontSize: 16.spMax,
              fontFamily: "Helvetica",
              fontWeight: FontWeight.bold,
              color: AppStyles.onPrimary,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            AppStyles.mainLogo,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "Tracker App",
            style: TextStyle(
              fontSize: 16.spMax,
              fontFamily: "Helvetica",
              fontWeight: FontWeight.bold,
              color: AppStyles.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
