import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/app_styles.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onpress;
  final String title;
  final IconData icon;

  const CustomListTile({
    super.key,
    required this.onpress,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
        bottom: 20.h,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        dense: true,
        onTap: onpress,
        leading: Icon(
          icon,
          size: 20.sp,
          color: AppStyles.onPrimary,
        ),
        title: Text(
          title,
          style: AppStyles().headerTextStyle.copyWith(
                fontSize: 20.sp,
              ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppStyles.onPrimary,
          size: 20.sp,
        ),
      ),
    );
  }
}
