// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';

class ValidationContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final String description;
  final String buttonTitle;
  final Color iconColor;
  const ValidationContainer({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.description,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 200.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  color: AppStyles.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.credit_card_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                height: 100.h,
                width: 100.w,
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 30.sp,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Material(
            child: Text(
              text,
              style: AppStyles().bodyTextStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                  color: AppStyles.onPrimary),
            ),
          ),
          Material(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles().bodyTextStyle.copyWith(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              buttonTitle,
              style: AppStyles().bodyTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
