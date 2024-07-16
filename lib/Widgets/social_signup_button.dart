import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSignupButton extends StatelessWidget {
  final String imageUrl;
  final Color? borderColor;
  final Color color;
  final Color textColor;
  final String buttonName;
  final VoidCallback onPress;
  const SocialSignupButton({
    super.key,
    required this.imageUrl,
    this.borderColor = Colors.black,
    required this.textColor,
    required this.buttonName,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          fixedSize: Size(374.w, 63.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              100.r,
            ),
            side: BorderSide(
              width: 0.5.h,
              color: borderColor!,
            ),
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              buttonName,
              style: TextStyle(
                color: textColor,
                fontSize: 14.spMax,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
