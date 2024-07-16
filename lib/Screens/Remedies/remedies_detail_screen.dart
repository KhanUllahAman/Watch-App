import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Models/remedies_model.dart';

class RemediesDetailScreen extends StatelessWidget {
  final RemediesModel item;
  const RemediesDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.remedyName,
          style: AppStyles().headerTextStyle.copyWith(
                fontSize: 18.sp,
              ),
          overflow: TextOverflow.fade,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                item.imageUrl,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                item.remedyDescription,
                style: AppStyles().bodyTextStyle.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
